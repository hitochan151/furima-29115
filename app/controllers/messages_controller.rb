class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :message_params, only: [:create]

  def new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message
    end
  end
end

private

 def message_params
   params.require(:message).permit(:text).merge(item_id: params[:item_id], user_id: current_user.id)
 end