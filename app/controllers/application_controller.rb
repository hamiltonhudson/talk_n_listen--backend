class ApplicationController < ActionController::API

  def secret_key
    ENV['SECRET_KEY']
  end

  def authorization_token
    token = request.headers["Authorization"]
  end

  def decoded_token
    begin
      return JWT.decode authorization_token(), secret_key(), true
    rescue JWT::VerificationError, JWT::DecodeError
      return nil
      # nil
    end
  end

  def valid_token?
    !!authenticate
  end

  def requires_login
    if !valid_token?
      render json: {
        message: "You wrong!"
      }, status: :unauthorized
    end
  end

  # def payload
  #   {name: params["username"], id: @user.id}
  # end

  def payload(name, id)
    { name: name, id: id }
  end

  def get_token(payload)
    JWT.encode payload, secret_key(), 'HS256'
  end

  def authenticate
    begin
      decoded = JWT.decode(authorization_token(), secret_key(), true, { algorithm: 'HS256' })
    rescue JWT::VerificationError, JWT::DecodeError
      return nil
    end
    decoded
  end

  # def is_admin
  #   decoded_token[0]["id"]
  # end


end
