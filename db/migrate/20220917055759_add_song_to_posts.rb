class AddSongToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :song, :text
  end
end
