class Api::V1::AuthController < ApplicationController

  def create
    @user = User.find_by(username: params["username"])
    payload = { name: params["username"] }
    secret_key = secret_key()
    token = JWT.encode payload, secret_key, 'HS256'
    if (@user && @user.authenticate(params["password"]))
      render json: {
        username: @user.username,
        id: @user.id,
        token: token
      }
    else
      render json: {
        errors: "Those credentials don't match anything we have in our database"
      }, status: :unauthorized
    end
  end


  # private
    # def auth_params
    #   params.require(:auth).permit(:email, :password)
    # end

end
