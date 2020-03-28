class RoomsController < ApplicationController

  def create
    @room = Room.create(room_params)
    redirect_to room_path(@room)
  end

  def index
    rooms = Room.includes(:user).order("updated_at DESC")
    @users = rooms.users
  end

  def show
    @room = Room.find(params[:id])
    room_user = @room.users
    private_room(room_user)
  end

  private
    
    def room_params
      params.require(:room).permit(user_ids: [])
    end

    def private_room(user)
      unless @room.users.include?(current_user) then
        redirect_to root_path
      end
    end

end
