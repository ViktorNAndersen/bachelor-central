#     t.string "type"
#     t.string "name"
#     t.string "address"
#     t.bigint "stock_id", null: false
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["stock_id"], name: "index_locations_on_stock_id"
class Location < ApplicationRecord
  has_many :logs
  has_many :users
  belongs_to :stock
end
