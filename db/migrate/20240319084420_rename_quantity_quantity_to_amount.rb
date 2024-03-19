class RenameQuantityQuantityToAmount < ActiveRecord::Migration[7.1]
  def change
    rename_column :quantities, :quantity, :amount
  end
end
