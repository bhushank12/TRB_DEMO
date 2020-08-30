class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :title
      t.string :first_name
      t.string :last_name
      t.string :customer_name
      t.string :gender
      t.datetime :birth_date
      t.string :mobile_number
      t.timestamps
    end
  end
end
