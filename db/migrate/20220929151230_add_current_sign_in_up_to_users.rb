class AddCurrentSignInUpToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :current_sign_in_up, :datetime
  end
end
