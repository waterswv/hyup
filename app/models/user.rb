class User < ApplicationRecord
  has_secure_password

  include Gravtastic
  gravtastic

#validations
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: {with: VALID_EMAIL_REGEX}
  validates :password_digest, presence: true
  validates :phone, presence: true, numericality: true, length: {minimum: 10, maximum: 15}

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user ? @user.authenticate(params[:password]) : false
  end
end
