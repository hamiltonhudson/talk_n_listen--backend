class UserChatSerializer < ActiveModel::Serializer
  attributes :id, :chat_id, :user_id, :user, :message_text, :created_at
  # belongs_to :chat, serializer: UserChatSerializer
  # belongs_to :user, serializer: UserChatSerializer

end
