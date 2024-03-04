class Supplier < Location
  # Inherits :belongs_to stock from Location
  has_many :units
end
