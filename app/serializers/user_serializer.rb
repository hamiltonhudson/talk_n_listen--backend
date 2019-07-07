class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :user_chats
  has_many :user_chats
  has_many :chats, through: :user_chats
  
end
