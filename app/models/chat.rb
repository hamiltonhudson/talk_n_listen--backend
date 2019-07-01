class Chat < ApplicationRecord
  has_many :user_chats
  # has_one :user_chat
  has_many :users, through: :user_chats

end
