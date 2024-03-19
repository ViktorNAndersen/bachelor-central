class AddOrderedByToOrders < ActiveRecord::Migration[7.1]
  def change
    add_reference :orders, :ordered_by, null: false, foreign_key: { to_table: :users }
  end
end
