class User < ApplicationRecord
  has_secure_password
  has_one :listing, dependent: :destroy

  include Gravtastic
  gravtastic

#validations
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: {minimum: 6}, :on => :create
  validates :phone, presence: true, numericality: true, length: {minimum: 10, maximum: 15}

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user ? @user.authenticate(params[:password]) : false
  end
end
