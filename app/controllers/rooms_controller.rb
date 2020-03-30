class RoomsController < ApplicationController

  def create
    @room = Room.create(room_params)
    redirect_to room_path(@room)
  end

  def show
    @room = Room.find(params[:id])
    private_room(@room.users)
    @messages = @room.messages.includes(:user)
    @message = Message.new
  end

  private
    
    def room_params
      params.require(:room).permit(user_ids: [])
    end

    def private_room(room_member)
      unless room_member.include?(current_user) then
        redirect_to root_path
      end
    end

end
