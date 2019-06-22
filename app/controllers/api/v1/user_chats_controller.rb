class Api::V1::UserChatsController < ApplicationController

  def index
    @user_chats = UserChat.all
    render json: @user_chats
  end

  # def show
  #   @user_chat = UserChat.find(params[:id])
  #   # @user_chat = UserChat.find_by(id: params[:id])
  #   @user_chat = UserChat.find_by(user_id: params[:user_id])
  # end

end
