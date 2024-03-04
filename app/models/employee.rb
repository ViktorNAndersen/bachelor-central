class Employee < User
  belongs_to :unit, class_name: 'Location', foreign_key: 'location_id'
  has_many :orders, foreign_key: 'ordered_by_id'
end
