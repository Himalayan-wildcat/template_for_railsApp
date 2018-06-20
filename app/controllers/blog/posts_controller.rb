module Blog
  class PostsController < BlogController

    def index
        @posts = Post.most_recent.published.paginate(:page => params[:page], per_page:3)
    end

    def show
      @post = Post.find(params[:id])
    end
  end

end    
