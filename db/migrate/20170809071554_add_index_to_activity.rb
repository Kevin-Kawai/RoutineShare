class AddIndexToActivity < ActiveRecord::Migration[5.0]
  def change
    add_index :activities, :routine_id
  end
end
