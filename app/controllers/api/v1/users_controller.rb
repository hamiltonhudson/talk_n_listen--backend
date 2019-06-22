class Api::V1::UsersController < ApplicationController
  before_action :auth, only: [:index, :show]

  def index
    render json: User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def create
    @user = User.new
    @user.username = params[:username]
    @user.password = params[:password]
    if (@user.save)
      render json: {
        username: @user.username,
        id: @user.id
      }
    else
      render json: {
        errors: @user.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def users_chats
    @user = User.find_by(id: params[:user_id])
    render json: @user.user_chats
  end

  # def update
  #   find_user
  #   if @user.valid?
  #     @user.save
  #     render :json, status: :ok
  #   else
  #     render :json, @user.errors.full_messages
  #   end
  # end

  # def destroy
  #   find_user
  #   @user.destroy
  # end

  def auth
    if !valid_token?
      render json: {
        message: "You wrong!"
      }, status: :unauthorized
    end
  end

  private
    # def find_user
    #   @user = User.find(params[:id])
    # end

    # def user_params
    #   params.require(:user).permit(:name, :email, :password, :username)
    # end

    # def user_params
    #   params.require(:user).permit(:username, :password)
    # end

end
