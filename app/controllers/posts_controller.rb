class PostsController < ApplicationController
  
  def index
    @posts = Post.includes(:user).order("created_at DESC")
  end

  def create
    @post = Post.new(post_params)
  end

  private

  def post_params
    params.require(:tweet).permit(:title, :image).merge(user_id: current_user.id)
  end
end
