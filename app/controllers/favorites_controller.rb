class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:create, :destroy]

  def create
    @favorite = @post.favorites.new(user: current_user)

    if @favorite.save
      redirect_to @post, notice: 'You favorited this post.'
    else
      redirect_to @post, alert: 'Unable to favorite this post.'
    end
  end

  def destroy
    @favorite = @post.favorites.find_by(user: current_user)
    if @favorite&.destroy
      redirect_to @post, notice: 'You unfavorited this post.'
    else
      redirect_to @post, alert: 'Unable to unfavorite this post.'
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
