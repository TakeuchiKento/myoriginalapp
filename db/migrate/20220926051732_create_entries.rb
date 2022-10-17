class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.references :user, null: false, foreign_key: true
      t.references :dmroom, null: false, foreign_key: true

      t.timestamps
    end
  end
end
