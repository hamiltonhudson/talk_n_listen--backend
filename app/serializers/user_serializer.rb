class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
  has_many :user_chats
  has_many :chats, through: :user_chats
end
