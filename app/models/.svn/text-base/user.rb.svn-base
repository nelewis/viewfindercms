class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation

  validates :username, presence: { message: "Please enter a username." }
  validates :password_digest, presence: { message: "Please enter a password." }
  validates :password, confirmation: { message: "Passwords don't match." }
  has_secure_password
end
