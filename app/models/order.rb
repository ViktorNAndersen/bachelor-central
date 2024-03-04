class Order < ApplicationRecord
  belongs_to :employee, class_name: 'User', foreign_key: 'ordered_by_id'

  has_many :order_items
  has_many :products, through: :order_items
end
