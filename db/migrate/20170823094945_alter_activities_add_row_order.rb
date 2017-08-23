class AlterActivitiesAddRowOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :row_order, :integer
    add_index :activities, :row_order
  end
end
