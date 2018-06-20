module Blog
  class PostsController < BlogController

    def index
      @posts = Post.most_recent.published
    end

    def show
      @post = Post.find(params[:id])
    end
  end

end    
