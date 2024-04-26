class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show,:system_destroy]

  def index
    if params[:search]
      @posts = Post.where("title ILIKE :search OR body ILIKE :search OR meal ILIKE :search OR difficulty ILIKE :search OR cuisine ILIKE :search", search: "%#{params[:search]}%").includes(:likes)
    else
      @posts = Post.all.includes(:likes)
    end

    if params[:sort_by] == 'date'
      @posts = @posts.order(created_at: :desc)
    elsif params[:sort_by] == 'likes'
      @posts = @posts.left_joins(:likes)
                     .group(:id)
                     .order('COUNT(likes.id) DESC')
    end

    render :index
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'Blog post was successfully created.'
      redirect_to post_path(@post)
    else
      flash.now[:error] = 'Unable to create blog post.'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = 'Post was successfully updated.'
      redirect_to post_path(@post)
    else
      flash.now[:error] = 'Unable to update post.'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])

    @post.favorites.each do |favorite|
      favorite.destroy
    end

    @post.forks.each do |fork|
      fork.destroy
    end

    @post.destroy
    flash[:success] = 'Post was successfully deleted.'
    redirect_to posts_url
  end
  def system_destroy
    @post = Post.find(params[:id])

    @post.favorites.each do |favorite|
      favorite.destroy
    end

    @post.forks.each do |fork|
      fork.destroy
    end

    @post.destroy
    flash[:success] = 'Post was deleted due to poor perfomance.'
    redirect_to posts_url
  end

  def require_permission
    @user = User.find(params[:user_id])
    if @user.creator != current_user
      flash[:error] = 'You do not have permission to do that.'
      redirect_to user_path(@user)
    end
  end
  def flag
    @post = Post.find(params[:id])

    if current_user.flags.exists?(post_id: @post.id)
      redirect_to post_path, alert: 'You have already flagged this post.'
      return
    end

    @flag = @post.flags.build(user_id: current_user.id)

    if @flag.save
      check_flag_threshold
      redirect_to @post, notice: 'Post has been flagged.'
    else
      redirect_to @post, alert: 'Failed to flag the post.'
    end
  end

  def unflag
    @post = Post.find(params[:id])
    @flag = current_user.flags.find_by(post_id: @post.id)
    if @flag.destroy
      redirect_to @post, notice: 'Post has been unflagged.'
    else
      redirect_to @post, alert: 'Failed to unflag the post.'
    end
  end

  def fork
    @post = Post.find(params[:id])
    @fork = current_user.forks.build(post: @post)
    if @fork.save
      redirect_to @fork, notice: 'Recipe forked successfully.'
    else
      redirect_to @post, alert: 'Failed to fork the recipe.'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :meal, :difficulty, :cuisine)
  end
  def check_flag_threshold
    if @post.flags.count >= 2
      system_destroy
    end
  end

  def system_destroy
    @post.favorites.destroy_all
    @post.forks.destroy_all
    @post.destroy
    flash[:success] = 'Post was deleted due to poor performance.'
  end
end
