class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :message_params, only: [:create]

  def new
  end

  def create
    @message = Message.new(message_params)
    @message.save
  end
end

private

 def message_params
   params.require(:message).permit(:text).merge(item_id: params[:item_id], user_id: current_user.id)
 end