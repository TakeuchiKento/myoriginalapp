class AddImageToLetters < ActiveRecord::Migration[6.1]
  def change
    add_column :letters, :image, :string
  end
end
