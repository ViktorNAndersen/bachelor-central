#     t.integer "status"
#     t.decimal "total_price", precision: 10, scale: 2
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.bigint "ordered_by_id", null: false
#     t.index ["ordered_by_id"], name: "index_orders_on_ordered_by_id"
class Order < ApplicationRecord
  belongs_to :ordered_by, class_name: 'User', foreign_key: 'ordered_by_id'

  has_many :order_items
  has_many :products, through: :order_items

  enum status: { pending: 0, completed: 1, cancelled: 2 }
end
