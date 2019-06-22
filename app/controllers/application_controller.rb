class ApplicationController < ActionController::API

  def secret_key
    'secret key'
  end

  def authorization_token
    token = request.headers["Authorization"]
  end

  def decoded_token
    decoded_token = JWT.decode authorization_token(), secret_key(), true
  end

  def authenticate
    begin
      decoded = JWT.decode(authorization_token(), secret_key(), true, { algorithm: 'HS256' })
    rescue JWT::VerificationError
      return nil
    end
    decoded
  end

  def valid_token?
    !!authenticate
  end

end
