class ApplicationController < ActionController::API
  include JsonWebToken
  before_action :authenticate_request

  private

  def authenticate_request
    header = request.headers["Authorization"]
    unless header
      render json: {message: "No Authorization Header Sent"}, status: :forbidden
    else
      begin
        auth_header = request.headers["Authorization"]
        token = get_token(auth_header)
        decoded_token = JWT.decode(token, get_secret_key)
        payload = decoded_token.first
        user_id = payload["id"]
        @account = Account.find(user_id)
      rescue => exception
        render json: {message: "Error: #{exception}"}, status: :forbidden
      end
    end
  end

  def get_token(auth_header)
    auth_header.split(" ")[1]
  end

  def get_secret_key
    ENV['SECRET_KEY_BASE'] || Rails.application.secrets.secret_key_base
  end

end
