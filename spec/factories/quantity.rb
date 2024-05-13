FactoryBot.define do
  factory :quantity do
    association :stock
    association :product
    amount { 100 }
  end
end