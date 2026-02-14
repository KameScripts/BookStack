class SessionsController < ApplicationController
  def new
    # ログイン画面を表示するだけ
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    
    # ユーザーが存在し、かつパスワードが正しいかチェック
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id # ブラウザのCookieにユーザーIDを保存
      redirect_to books_path, notice: "ログインしました！"
    else
      flash.now[:alert] = "メールアドレスまたはパスワードが正しくありません"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil # セッションを空にする
    redirect_to login_path, notice: "ログアウトしました", status: :see_other
  end
end