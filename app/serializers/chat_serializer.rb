class ChatSerializer < ActiveModel::Serializer
  attributes :id, :message
  has_many :user_chats
  has_many :users, through: :user_chats
end
