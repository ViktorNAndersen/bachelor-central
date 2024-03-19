class CreateLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :logs do |t|
      t.string :type
      t.string :title
      t.string :description
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
