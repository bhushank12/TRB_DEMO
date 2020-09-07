class AddColumnToCall < ActiveRecord::Migration[6.0]
  def up
    add_column :calls, :vehicle_type, :string
  end

  def down
    remove_column :calls, :vehicle_type, :string
  end
end
