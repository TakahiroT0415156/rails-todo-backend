class Api::V1::UsersController < ApplicationController

  def index
    render json: { status: 200, users: User.all }
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: { status: 200, user: user }
    else
      render json: { status: 500, message: "新規登録に失敗しました" }
    end
  end

  def show
    user = User.find(params[:id]) 
    render json: { status: 200, users: user }
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
