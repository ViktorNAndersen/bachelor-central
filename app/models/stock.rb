#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false

class Stock < ApplicationRecord
  has_many :quantities
  has_many :products, through: :quantities

  has_one :unit, -> { where(type: 'Unit') }, class_name: 'Location'
  has_one :supplier, -> { where(type: 'Supplier') }, class_name: 'Location'
end
