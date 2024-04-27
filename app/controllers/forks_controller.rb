class ForksController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_fork, only: [:show, :edit, :update, :destroy]

  def new
    @post = Post.find(params[:post_id])
    @fork = Fork.new
  end

  def show
    @fork = Fork.find(params[:id])
    @parent = @fork
    @commentable = @fork
    @comment = Comment.new
    render :show
  end

  def create
    @post = Post.find(params[:post_id])
    @fork = current_user.forks.new(fork_params)
    @fork.post = @post

    if @fork.save
      redirect_to post_fork_path(@post, @fork), notice: 'Recipe forked successfully.'
    else
      render :new, alert: 'Failed to create new post from forked recipe.'
    end
  end

  def edit
  end

  def update
    if @fork.update(fork_params)
      redirect_to [@fork.post, @fork], notice: 'Fork was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @fork.destroy
    redirect_to posts_path, notice: 'Fork was successfully deleted.'
  end

  private

  def set_fork
    @fork = Fork.find(params[:id])
  end

  def fork_params
    params.require(:fork).permit(:title, :body, :meal, :difficulty, :cuisine, :image)
  end
end
