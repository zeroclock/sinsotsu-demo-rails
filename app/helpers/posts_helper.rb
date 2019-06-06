module PostsHelper
    # ログインユーザーが投稿者と一致するか
    def is_posted_user?(post)
       current_user == post.user
    end
end
