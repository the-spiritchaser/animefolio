class UsersController < ApplicationController
  
  def show
    @posts = Post.includes(:user).order("created_at DESC")
  end

  def user_params
    params.require(:user).permit(:name)
  end
end
