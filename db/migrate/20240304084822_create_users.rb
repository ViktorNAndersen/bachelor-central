class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :type
      t.string :username
      t.string :password
      t.integer :role, default: 0

      t.timestamps
    end
  end
end
