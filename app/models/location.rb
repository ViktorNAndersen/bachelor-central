class Location < ApplicationRecord
  has_many :logs
  has_many :users
  belongs_to :stock
end
