class User < ApplicationRecord
  has_secure_password
  has_many :user_chats
  has_many :chats, through: :user_chats
  validates :username, presence: true, uniqueness: true
  # validates :email, presence: true, uniqueness: true
  validates :password, presence: true

end
