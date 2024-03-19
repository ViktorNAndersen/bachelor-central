class AddCreatedByIdToUsers < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :created_by, null: false, foreign_key: { to_table: :users }
  end
end
