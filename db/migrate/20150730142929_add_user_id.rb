class AddUserId < ActiveRecord::Migration
  def up
    add_column :users, :user_id, :integer
  end
  def down
    remove_column :users, :user_id, :integer
  end
end
