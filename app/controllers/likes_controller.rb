class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_likeable

  def create
    @like = current_user.likes.build(likeable: @likeable)

    if @like.save
      redirect_to [@likeable], notice: 'You sweeted this post!'
    else
      redirect_to [@likeable], alert: 'Unable to sweet this.'
    end
  end

  def destroy
    @like = @likeable.likes.find_by(user: current_user)
    if @like&.destroy
      redirect_to [@likeable], notice: 'You unsweeted this post.'
    else
      redirect_to [@likeable], alert: 'Unable to unsweet this.'
    end
  end

  private

  def set_likeable
    resource, id = request.path.split('/')[1, 2]
    @likeable = resource.singularize.classify.constantize.find(id)
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: 'Post not found.'
  end
end
