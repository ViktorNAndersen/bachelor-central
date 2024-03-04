class Product < ApplicationRecord
  has_many :quantities
  has_many :stocks, through: :quantities

  has_many :order_items
  has_many :orders, through: :order_items
end
