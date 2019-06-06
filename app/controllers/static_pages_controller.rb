class StaticPagesController < ApplicationController
  
  def home
    @user = current_user
    @posts = Post.paginate(page: params[:page], per_page: 5)
    @post = @user.posts.build if logged_in?
  end

  def help
  end
end
