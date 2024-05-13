FactoryBot.define do
  factory :location do
    type { '' }
    name { 'MyString' }
    address { 'MyString' }
    association :stock
  end

  factory :unit, parent: :location do
    type { "Unit" }
    association :stock
  end

  factory :supplier, parent: :location do
    type { "Supplier" }
    association :stock
  end
end