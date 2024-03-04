class Unit < Location
  # Inherits :belongs_to stock from Location
  has_many :employees, class_name: 'User'
  belongs_to :supplier

end
