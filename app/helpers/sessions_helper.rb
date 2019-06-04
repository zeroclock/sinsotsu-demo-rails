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
    
    # 渡されたユーザがログインユーザと一致するか
    def current_user?(user)
       user == current_user
    end
    
    # ログアウト処理
    def log_out
       session.delete(:user_id)
       @current_user
    end
    
    # 記憶したURLにリダイレクト
    def redirect_back(default)
       redirect_to(session[:forwarding_url] || default)
       session.delete(:forwarding_url)
    end
    
    # アクセスしようとしたURLを記憶
    def store_location
       session[:forwarding_url] = request.original_url if request.get? 
    end
end
