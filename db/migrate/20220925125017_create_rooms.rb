class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      t.index :name, unique: true

      t.timestamps
    end
  end
end
