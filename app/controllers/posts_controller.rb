class PostsController < ApplicationController
    def index
        render: index
        @posts = Post.all
    end

end
