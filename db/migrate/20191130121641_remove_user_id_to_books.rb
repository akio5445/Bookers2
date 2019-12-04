class RemoveUserIdToBooks < ActiveRecord::Migration[5.2]
  def change
    remove_index :books, :User_id
    rename_column :books, :User_id, :user_id
  end
end
