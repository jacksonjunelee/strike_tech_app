class ChangeUserToEngineId < ActiveRecord::Migration
  def change
    rename_column :engines, :type, :integer
  end
end
