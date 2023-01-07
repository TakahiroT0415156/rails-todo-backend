class Api::V1::PostsController < ApplicationController
  def index
    render json: { status: 200, posts: Post.all }
  end

  def create
    post = Post.new(post_params)
    if post.save
      render json: { status: 200, post: post }
    else
      render json: { status: 500, message: "Todoの作成に失敗しました" }
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.destroy
      render json: { status: 200, post: post }
    else
      render json: { status: 500, message: "Todoの削除に失敗しました" }
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :completed)
  end
end
