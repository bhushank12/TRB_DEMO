class CreateCalls < ActiveRecord::Migration[6.0]
  def change
    create_table :calls do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :make
      t.string :model
      t.string :submodel
      t.string :category
      t.string :subcategory
      t.datetime :registration_date
      t.datetime :policy_expiry

      t.timestamps
    end
  end
end
