class Api::V1::ChatsController < ApplicationController
  before_action: auth, only: [:index, :show]

  def index
    render json: Snack.all
  end

  def auth
    if !valid_token?
      render json: {
        message: "You wrong!"
      }, status: :unauthorized
    end
  end

  def show
    @chat = Chat.find_by(id: params[:id])
  end

end
