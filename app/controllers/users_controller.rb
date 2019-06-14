class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :show, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  
  def index
    unless params[:key].blank? && params[:sort]
      key = params[:key].to_s
      sort = params[:sort].to_s
      key_sort = key + " " + sort
      @users = User.order(key_sort).paginate(page: params[:page], per_page: 10)
    else
      @users = User.paginate(page: params[:page], per_page: 10)
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "会員登録に成功しました"
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "会員情報の更新に成功しました"
      redirect_to root_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    # 正しいユーザーかどうか
    def correct_user
      @user = User.find(params[:id])
      unless current_user?(@user)
        flash[:danger] = "自分のユーザー情報のみ参照/更新できます"
        redirect_to(root_url)
      end
    end
    
    # 管理者かどうか
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
