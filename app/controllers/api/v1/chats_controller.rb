class Api::V1::ChatsController < ApplicationController
  before_action :requires_login, only: [:index, :show, :create]

  def index
    render json: Chat.all
  end

  def create
    chat = Chat.new(chat_params)
    if chat.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        ChatSerializer.new(chat)
      ).serializable_hash
      ActionCable.server.broadcast 'chats_channel', serialized_data
      head :ok
    end
  end

  def show
    @chat = Chat.find_by(id: params[:id])
  end

  private
    def chat_params
      params.require(:chat).permit(:chat_name)
    end

end
