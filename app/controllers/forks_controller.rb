class ForksController < ApplicationController
    before_action :authenticate_user! 
  
    def new
      @post = Post.find(params[:post_id])
      @fork = Fork.new(post: @post)
    end
  
    def create
        @post = Post.find(params[:post_id])
        @fork = current_user.forks.build(fork_params.merge(post: @post))
        if @fork.save
          new_post = Post.new(title: @fork.title, body: @fork.body, meal: @fork.meal, difficulty: @fork.difficulty, cuisine: @fork.cuisine, user: current_user)
          if new_post.save
            redirect_to post_path(new_post), notice: 'Recipe forked successfully.'
          else
            render :new, notice: 'Failed to create new post from forked recipe.'
          end
        else
          render :new
        end
      end
      
      private
      
      def fork_params
        params.require(:fork).permit(:title, :body, :meal, :difficulty, :cuisine)
      end
      
  end
  