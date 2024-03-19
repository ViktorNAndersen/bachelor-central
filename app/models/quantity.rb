#     t.bigint "stock_id", null: false
#     t.bigint "product_id", null: false
#     t.integer "quantity"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["product_id"], name: "index_quantities_on_product_id"
#     t.index ["stock_id"], name: "index_quantities_on_stock_id"
class Quantity < ApplicationRecord
  belongs_to :stock
  belongs_to :product
end
