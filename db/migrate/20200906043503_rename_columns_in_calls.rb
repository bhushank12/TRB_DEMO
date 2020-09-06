class RenameColumnsInCalls < ActiveRecord::Migration[6.0]
  def up
    rename_column :calls, :make, :vmake
    rename_column :calls, :model, :vmodel
    rename_column :calls, :submodel, :vsubmodel
    rename_column :calls, :category, :vcategory
    rename_column :calls, :subcategory, :vsubcategory
  end

  def down
    rename_column :calls, :vmake, :make
    rename_column :calls, :vmodel, :model
    rename_column :calls, :vsubmodel, :submodel
    rename_column :calls, :vcategory, :category
    rename_column :calls, :vsubcategory, :subcategory
  end
end
