class ChangeDateFormatInCustomerTable < ActiveRecord::Migration[6.0]
  def up
    change_column :customers, :birth_date, :date
  end

  def down
    change_column :customers, :birth_date, :datetime
  end
end
