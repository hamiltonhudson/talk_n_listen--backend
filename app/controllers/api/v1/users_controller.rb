class Api::V1::UsersController < ApplicationController
  before_action :requires_login, only: [:index, :show, :users_chats]
  # before_action :is_admin, only: [:index]

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
        token: get_token(payload(@user.username, @user.id))
      }
    else
      render json: {
        errors: @user.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def users_chats
    @user = User.find_by(id: params[:user_id])
    # render json: @user.user_chats
    # @user_chats = @user.user_chats.map { |user_chat| user_chat.chat.message }

    # @user_chat_msgs = @user.user_chat_msgs
    # render json: @user_chat_msgs

    @user_chat_instances = @user.user_chat_instances
    render json: @user_chat_instances
  end

  def auth
    if !valid_token?
      render json: {
        message: "You wrong!"
      }, status: :unauthorized
    end
  end

end
