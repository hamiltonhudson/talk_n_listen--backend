class Api::V1::UserChatsController < ApplicationController
  before_action :requires_login, only: [:index, :show, :create]

  def index
    @user_chats = UserChat.all
    render json: @user_chats
  end

  def create
    user_chat = UserChat.new(user_chat_params)
    chat = Chat.find(user_chat_params[:chat_id])
    user = User.find(user_chat_params[:user_id])
    user_chat.message_text = params[:message_text]
    user_chat.chat_id = params[:chat_id]
    user_chat.user_id = params[:user_id]
    if user_chat.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        UserChatSerializer.new(user_chat)
      ).serializable_hash
      UserChatsChannel.broadcast_to chat, serialized_data
      head :ok
    end
  end

  private
    def user_chat_params
      params.require(:user_chat).permit(:message_text, :chat_id, :user_id)
    end

end
