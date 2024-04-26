class ForksController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.find(params[:post_id])
    @fork = Fork.new
  end

  def show
    @fork = Fork.find(params[:id])
  end

  def create
    @post = Post.find(params[:post_id])
    @fork = current_user.forks.new(fork_params)
    @fork.post = @post

    if @fork.save
      redirect_to post_fork_path(@post, @fork), notice: 'Recipe forked successfully.'
    else
      render :new, notice: 'Failed to create new post from forked recipe.'
    end
  end

  private

  def fork_params
    params.require(:fork).permit(:title, :body, :meal, :difficulty, :cuisine, :image)
  end
end
