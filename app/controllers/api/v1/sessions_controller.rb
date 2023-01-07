class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: { status: 200, message: "ログインしました" }
    else
      render json: { status: 500, message: "メールアドレスかパスワードが一致しません" }
    end
  end

  def destroy
    session[:user_id] = nil
    render json: { status: 200, message: "ログアウトしました" }
  end
end
