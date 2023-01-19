class Account < ApplicationRecord

  attr_accessor :password
  validates_confirmation_of :password

  before_save :encrypt_password

  validates :user_id, uniqueness: true, presence: true


  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password,password_salt)
  end

end
