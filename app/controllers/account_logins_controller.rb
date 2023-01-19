class AccountLoginsController < ApplicationController
  skip_before_action :authenticate_request

  def login
    @account = Account.find_by_user_id(params[:user_id])
    if @account.present?
      if authenticate(params[:password])
        token = jwt_encode(user_id: @account.id)
        set_headers(token)
        render json: {message: 'Successfully logged in'}, status: 200
      else
        render json: {error: 'Password is not correct'}, status: :unauthorized
      end
    else
      render json: {error: 'Unauthorized'}, status: :unauthorized
    end
  end

  def authenticate(password)
    @account.password_hash == BCrypt::Engine.hash_secret(password, @account.password_salt)
  end

  def set_headers(token)
    response.headers['AUTH-TOKEN'] = token
  end

end
