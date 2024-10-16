class AddUsernameToUser < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :user, :string
  end
end
