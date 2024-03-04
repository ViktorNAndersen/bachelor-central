class CreateQuantities < ActiveRecord::Migration[7.1]
  def change
    create_table :quantities do |t|
      t.references :stock, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
