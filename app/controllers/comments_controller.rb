class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post
    before_action :set_comment, only: [:show, :edit, :update, :destroy]

    def create
      @comment = @post.comments.build(comment_params)
      @comment.user = current_user

      if @comment.save
        redirect_to @post, notice: 'Comment was successfully created.'
      else
        redirect_to @post, alert: 'Failed to create comment.'
      end
    end

    def index
        @comments = Comment.all 
      end

      def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to @comment.post, notice: 'Comment was successfully deleted.'
      end  


    private

    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_comment
      @comment = @post.comments.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
  end