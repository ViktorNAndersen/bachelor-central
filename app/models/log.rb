#     t.string "type"
#     t.string "title"
#     t.string "description"
#     t.bigint "location_id", null: false
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.bigint "user_id", null: false
#     t.index ["location_id"], name: "index_logs_on_location_id"
#     t.index ["user_id"], name: "index_logs_on_user_id"
class Log < ApplicationRecord
  belongs_to :location
  belongs_to :user
end
