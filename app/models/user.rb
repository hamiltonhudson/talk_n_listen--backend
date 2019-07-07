class User < ApplicationRecord
  has_secure_password
  has_many :user_chats
  has_many :chats, through: :user_chats
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  # def user_chat_msgs
  #   self.user_chats.all.map do |user_chat|
  #    user_chat.chat.message
  #   end
  #   # return user_chat.chat.message
  # end
  #
  # def user_chat_instances
  #   self.user_chats.all.map do |user_chat|
  #    user_chat.chat
  #   end
  #   # return user_chat.chat.message
  # end

end
