class ChangeDateFormatInCallTable < ActiveRecord::Migration[6.0]
  def up
    change_column :calls, :registration_date, :date
    change_column :calls, :policy_expiry, :date
  end

  def down
    change_column :calls, :registration_date, :datetime
    change_column :calls, :policy_expiry, :datetime
  end
end
