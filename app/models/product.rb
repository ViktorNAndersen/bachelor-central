#     t.string "name"
#     t.string "description"
#     t.decimal "price", precision: 10, scale: 2
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
class Product < ApplicationRecord
  has_many :quantities
  has_many :stocks, through: :quantities

  has_many :order_items
  has_many :orders, through: :order_items
end
