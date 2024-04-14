class PostsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        @posts = Post.all
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
        @post = Post.new(params.require(:post).permit(:title, :body, :meal, :difficulty, :cuisine))
        if @post.save
            flash[:success] = 'New post successfully added!'
            redirect_to posts_url
        else
            puts @post.errors.full_messages
            flash.now[:error] = 'Post creation failed'
            render :new, status: :unprocessable_entity
        end
    end

end
