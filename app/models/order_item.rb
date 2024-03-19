#     t.bigint "order_id", null: false
#     t.bigint "product_id", null: false
#     t.integer "quantity"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["order_id"], name: "index_order_items_on_order_id"
#     t.index ["product_id"], name: "index_order_items_on_product_id"
class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
end
