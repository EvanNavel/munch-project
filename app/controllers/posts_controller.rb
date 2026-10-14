class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action -> { redirect_unless_owner(@post) }, only: [:edit, :update, :destroy]

  def index
    if params[:search].present?
      posts = search(Post, params[:search]).includes(:likes, :user)
      forks = search(Fork, params[:search]).includes(:user)
    else
      posts = Post.all.includes(:likes, :user)
      forks = Fork.all.includes(:user)
    end

    @items = (posts + forks).sort_by(&:created_at).reverse

    if params[:sort_by] == 'date'
      @items.sort_by!(&:created_at).reverse!
    elsif params[:sort_by] == 'likes'
      @items.sort_by! { |item| item.respond_to?(:likes) ? item.likes.size : 0 }.reverse!
    end

    render :index
  end


  def show
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
    handle_tags(@post, tag_params)
    if @post.save
      flash[:success] = 'Blog post was successfully created.'
      redirect_to post_path(@post)
    else
      flash.now[:error] = 'Unable to create blog post.'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    render :edit
  end

  def update
    handle_tags(@post, tag_params)
    if @post.update(post_params)
      flash[:success] = 'Post was successfully updated.'
      redirect_to post_path(@post)
    else
      flash.now[:error] = 'Unable to update post.'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    flash[:success] = 'Post was successfully deleted.'
    redirect_to posts_url
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  # Matches tag names, titles, descriptions, ingredients, and directions
  def search(model, term)
    table = model.table_name
    columns = %w[title description ingredients directions].map { |c| "#{table}.#{c} ILIKE :term" }
    model.left_joins(:tags)
         .where(["tags.name ILIKE :term", *columns].join(' OR '), term: "%#{model.sanitize_sql_like(term)}%")
         .distinct
  end

  def post_params
    params.require(:post).permit(:title, :description, :ingredients, :directions, :image)
  end

  def tag_params
    params.require(:post).permit(:meal_tags, :difficulty_tags, :cuisine_tags, :dietary_tags)
  end

  def handle_tags(post, tag_params)
    %w[meal difficulty cuisine dietary].each do |category|
      tag_names = tag_params["#{category}_tags"].to_s.split(',').map(&:strip).uniq
      current_tags = post.tags.where(category: category).pluck(:name)

      # Remove old tags
      (current_tags - tag_names).each do |old_name|
        old_tag = Tag.find_by(name: old_name, category: category)
        post.tags.delete(old_tag) if old_tag
      end

      # Add new tags
      (tag_names - current_tags).each do |new_name|
        new_tag = Tag.find_or_create_by(name: new_name, category: category)
        post.tags << new_tag unless post.tags.include?(new_tag)
      end
    end
  end
end
