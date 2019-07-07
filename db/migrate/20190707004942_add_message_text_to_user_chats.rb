class AddMessageTextToUserChats < ActiveRecord::Migration[5.2]
  def change
    add_column :user_chats, :message_text, :string
  end
end
