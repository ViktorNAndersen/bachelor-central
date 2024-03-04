FactoryBot.define do
  factory :log do
    type { 'Log Type' }
    title { 'Log Title' }
    description { 'Log Description' }
    association :user
    association :location
  end
end