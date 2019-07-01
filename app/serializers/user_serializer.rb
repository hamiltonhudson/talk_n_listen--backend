class UserSerializer < ActiveModel::Serializer
  # attributes :id, :name, :email, :password, :username
  attributes :id, :username
  has_many :user_chats
  has_many :chats, through: :user_chats
end
