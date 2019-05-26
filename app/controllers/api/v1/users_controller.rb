class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @user.save
      render json: @user, status: :ok
    else
      render :json, @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    find_user
    if @user.valid?
      @user.save
      render :json, status: :ok
    else
      render :json, @user.errors.full_messages
    end
  end

  def destroy
    find_user
    @user.destroy
  end


  private
    def find_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

end
