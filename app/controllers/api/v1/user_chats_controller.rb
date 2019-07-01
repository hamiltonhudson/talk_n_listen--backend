class Api::V1::UserChatsController < ApplicationController

  def index
    @user_chats = UserChat.all
    render json: @user_chats
  end

end
