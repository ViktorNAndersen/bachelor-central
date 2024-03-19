FactoryBot.define do
  factory :stock do
  end

  factory :quantities do
    association :product
    association :stock
    quantity { 10 }
  end
end