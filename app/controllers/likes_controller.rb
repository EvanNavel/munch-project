class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:create, :destroy]

  def create
    @like = @post.likes.new(user: current_user)

    if @like.save
      redirect_to @post, notice: 'You liked this post.'
    else
      redirect_to @post, alert: 'Unable to like this post.'
    end
  end

  def destroy
    @like = @post.likes.find_by(user: current_user)
    if @like&.destroy
      redirect_to @post, notice: 'You unliked this post.'
    else
      redirect_to @post, alert: 'Unable to unlike this post.'
    end
  end

  private

  def set_post
    @post = Post.find_by(id: params[:post_id])
    unless @post
      redirect_to posts_path, alert: 'Post not found.'
    end
  end
end
