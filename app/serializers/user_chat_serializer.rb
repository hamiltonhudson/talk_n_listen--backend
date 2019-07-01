class UserChatSerializer < ActiveModel::Serializer
  attributes :id
  # attributes :id, :user, :chat
  has_one :user
  # has_one :chat
  # has_one :chat, serializer: ChatSerializer
  belongs_to :chat, serializer: ChatSerializer
end
