#     t.string "type"
#     t.string "email"
#     t.string "password"
#     t.integer "role", default: 0
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.bigint "location_id"
#     t.index ["location_id"], name: "index_users_on_location_id"
class User < ApplicationRecord
  belongs_to :location, optional: true
  has_many :logs
end
