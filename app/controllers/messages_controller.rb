class MessagesController < ApplicationController
  before_action :set_room

  def create
    @message = @room.messages.create(message_params)
    redirect_to room_path(@room)
  end

  private

    def message_params
      params.required(:message).permit(:content).merge(user_id: current_user.id)
    end

    def set_room
      @room = Room.find(params[:room_id])
    end
end
