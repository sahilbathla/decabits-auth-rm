# frozen_string_literal: true
require "jwt"
module JsonWebToken
  extend ActiveSupport::Concern
  SECRET_KEY = Rails.application.secret_key_base

  def jwt_encode(payload, expiry = 1.year.from_now)
    payload[:exp] = expiry.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def jwt_decode(token)
    decoded_token = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new decoded_token
  end
end
