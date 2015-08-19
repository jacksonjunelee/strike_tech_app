class ChangeUserToEngine < ActiveRecord::Migration
  def change
    rename_column :usertoengines, :idusers, :user_id
  end
end
