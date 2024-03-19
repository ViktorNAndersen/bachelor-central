class CreateLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :locations do |t|
      t.string :type
      t.string :name
      t.string :address
      t.references :stock, null: false, foreign_key: true

      t.timestamps
    end
  end
end
