class AddReferencesToChats < ActiveRecord::Migration[6.1]
  def change
    add_reference :chats, :user, foreign_key: true
    add_reference :chats, :room, foreign_key: true
  end
end
