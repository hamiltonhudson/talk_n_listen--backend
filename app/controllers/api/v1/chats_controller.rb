class Api::V1::ChatsController < ApplicationController
  before_action :requires_login, only: [:index, :show]

  def index
    render json: Chat.all
  end

  def show
    @chat = Chat.find_by(id: params[:id])
  end

end
