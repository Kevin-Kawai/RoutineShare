class AlterRoutineAddUserId < ActiveRecord::Migration[5.0]
  def change
    add_column :routines, :user_id,:integer
    add_index :routines, :user_id
  end
end
