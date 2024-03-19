#     t.string "type"
#     t.string "email"
#     t.string "password"
#     t.integer "role", default: 0
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.bigint "location_id"
#     t.index ["location_id"], name: "index_users_on_location_id"
class Employee < User
  belongs_to :unit, class_name: 'Location', foreign_key: 'location_id'
  has_many :orders, foreign_key: 'ordered_by_id'
end
