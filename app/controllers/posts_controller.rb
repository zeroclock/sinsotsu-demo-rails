class PostsController < ApplicationController
    before_action :logged_in_user
    
    def create
      @post = current_user.posts.build(post_params)
      if @post.save
        flash[:success] = "投稿が完了しました"
        redirect_to root_url
      else
        flash[:danger] = @post.errors.full_messages.join("　|　")
        redirect_to root_path
      end
    end
    
    def show
      @post = Post.find(params[:id])
    end
    
    def edit
        
    end
    
    def update
        
    end
    
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to root_path
    end
    
    def index
      @posts = current_user.posts
    end
  
  
    private
  
      def post_params
         params.require(:post).permit(:title, :content) 
      end
end
