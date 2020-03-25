class UsersController < ApplicationController

  def index
    @users = User.includes(:posts).order("created_at DESC")
  end

  def show
    user = User.find(params[:id])
    @name = user.name
    @posts = user.posts.includes(:user).order("created_at DESC")
  end

  private

    def user_params
      params.require(:user).permit(:name)
    end
end
