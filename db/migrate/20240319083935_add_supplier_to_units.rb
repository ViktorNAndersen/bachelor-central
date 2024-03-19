class AddSupplierToUnits < ActiveRecord::Migration[7.1]
  def change
    add_column :locations, :supplier_id, :bigint
  end
end
