class Api::V1::UsersController < ApplicationController
  before_action :requires_login, only: [:index, :show, :users_chats]

  def index
    render json: User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    render json: @user
  end

  def create
    @user = User.new
    @user.username = params[:username]
    @user.password = params[:password]
    if (@user.save)
      render json: {
        username: @user.username,
        id: @user.id,
        user_chats: @user.user_chats,
        token: get_token(payload(@user.username, @user.user_chats, @user.id))
      }
    else
      render json: {
        errors: @user.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def chat_list
    @user = User.find_by(id: params[:user_id])
    @chats = Chat.all
    render json: @chats
  end

  def users_chats
    @user = User.find_by(id: params[:user_id])
    @user_chat_messages = @user.user_chats
    render json: @user_chat_messages
  end

  def users_chat_messages
    @user = User.find_by(id: params[:user_id])
    @user_chat_messages = @user.user_chats
    render json: @user_chat_messages
  end

  def auth
    if !valid_token?
      render json: {
        message: "You wrong!"
      }, status: :unauthorized
    end
  end

end
