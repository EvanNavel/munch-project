class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    posts = Post.where("title ILIKE :search OR body ILIKE :search OR meal ILIKE :search OR difficulty ILIKE :search OR cuisine ILIKE :search", search: "%#{params[:search]}%").includes(:likes, :user)
    forks = Fork.all.includes(:user)

    @items = (posts + forks).sort_by(&:created_at).reverse

    if params[:sort_by] == 'date'
      @items.sort_by!(&:created_at).reverse!
    elsif params[:sort_by] == 'likes'
      @items.sort_by { |item| item.respond_to?(:likes) ? item.likes.size : 0 }.reverse
    end

    render :index
  end

  def show
    @post = Post.find(params[:id])
    @parent = @post
    @commentable = @post
    @comment = Comment.new
    render :show
  end

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = current_user.posts.build(post_params)
    handle_tags(@post, params[:tags])
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
    handle_tags(@post, params[:tags])
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
    @post.destroy_with_associations
    flash[:success] = 'Post was successfully deleted.'
    redirect_to posts_url
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
    params.require(:post).permit(:title, :body, :image)
  end

  def handle_tags(post, tag_params)
    post.tags = tag_params.map { |tag_name| Tag.find_or_create_by(name: tag_name) }
  end
end
