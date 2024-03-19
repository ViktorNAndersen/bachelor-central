#     t.string "type"
#     t.string "name"
#     t.string "address"
#     t.bigint "stock_id", null: false
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["stock_id"], name: "index_locations_on_stock_id"
class Supplier < Location
  # Inherits :belongs_to stock from Location
  has_many :units, class_name: 'Location', foreign_key: 'supplier_id'
end
