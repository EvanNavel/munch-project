class FlagsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_flaggable

  def create
    @flag = current_user.flags.build(flaggable: @flaggable)
    if @flag.save
      check_flag_threshold_and_destroy
      redirect_to polymorphic_path(@flaggable), notice: 'Item flagged successfully.'
    else
      redirect_to polymorphic_path(@flaggable), alert: 'Failed to flag the item.'
    end
  end

  def destroy
    @flag = @flaggable.flags.find_by(user: current_user)
    if @flag&.destroy
      redirect_to polymorphic_path(@flaggable), notice: 'Flag removed successfully.'
    else
      redirect_to polymorphic_path(@flaggable), alert: 'Failed to remove flag.'
    end
  end

  private

  def set_flaggable
    @flaggable = find_parent_record
    redirect_to root_path, alert: 'Item not found.' unless @flaggable
  end

  def check_flag_threshold_and_destroy
    if @flaggable.flags.count >= 2
      system_destroy(@flaggable)
    end
  end

  def system_destroy(flaggable)
    flaggable.destroy
    flash[:success] = 'Item was deleted due to poor performance.'
  end
end
