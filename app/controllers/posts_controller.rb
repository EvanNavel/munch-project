class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    def index
    # Start Change 1
      if params[:search]
        @posts = Post.where("title LIKE :search OR body LIKE :search OR meal LIKE :search OR difficulty LIKE :search OR cuisine LIKE :search", search: "%#{params[:search]}%")
      else
    # End Change 1
        @posts = Post.all
      end
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
        @post = current_user.posts.build(params.require(:post).permit(:title, :body, :meal, :difficulty, :cuisine))
        if @post.save
          flash[:success] = 'Blog post was successfully created.'
          redirect_to posts_path(@post)
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
        if @post.update(params.require(:post).permit(:title, :body, :meal, :difficulty, :cuisine))
          flash[:success] = 'Post was successfully updated.'
          redirect_to post_path(@post)
        else
          flash.now[:error] = 'Unable to update post.'
          render :edit, status: :unprocessable_entity
        end
      end

      def destroy
        @post = Post.find(params[:id])
        @post.destroy
        flash[:success] = 'Post was successfully destroyed.'
        redirect_to posts_url
      end

      def require_permission
        @user = User.find(params[:user_id])
        if @user.creator != current_user
          flash[:error] = 'You do not have permission to do that.'
          redirect_to user_path(@user)
        end
      end

end
