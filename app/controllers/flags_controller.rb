class FlagsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_flaggable

 def create
  @flag = current_user.flags.build(flaggable: @flaggable)
  if @flag.save
    redirect_to polymorphic_path(@flaggable), notice: 'Item flagged successfully.'
  else
    redirect_to polymorphic_path(@flaggable), alert: 'Failed to flag the item.'
  end
end

  def destroy
    @flag = @flaggable.flags.find_by(user: current_user)
    if @flag.destroy
      redirect_to polymorphic_path(@flaggable), notice: 'Flag removed successfully.'
    else
      redirect_to polymorphic_path(@flaggable), alert: 'Failed to remove flag.'
    end
  end

  private

  def set_flaggable
    params.each do |name, value|
      if name.ends_with?("_id")
        model = name.chomp("_id").classify.constantize
        @flaggable = model.find(value)
        break
      end
    end
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, alert: "#{model.name} not found."
  end
end
