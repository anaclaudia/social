class AddIndexToUsersWebsite < ActiveRecord::Migration[5.0]
  def change
    add_index :users, :website, unique: true
  end
end
