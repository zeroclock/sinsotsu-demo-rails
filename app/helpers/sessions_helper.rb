module SessionsHelper
    
    # ログイン処理
    def log_in(user)
        session[:user_id] = user.id
    end
    
    # ログイン中ユーザーを返す
    def current_user
       if session[:user_id]
           @current_user ||= User.find_by(id: session[:user_id])
       end
    end
    
    # ログインしているか
    def logged_in?
        !current_user.nil?
    end
    
    # ログアウト処理
    def log_out
       session.delete(:user_id)
       @current_user
    end
end
