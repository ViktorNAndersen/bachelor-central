FactoryBot.define do
  factory :order do
    status { 0 }
    total_price { 1.54 }
    association :employee
  end

  factory :order_item do
    association :order
    association :product
    quantity { 1 }
  end
end