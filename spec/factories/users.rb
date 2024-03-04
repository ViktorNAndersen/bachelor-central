FactoryBot.define do
  factory :user do
    type { '' }
    email { 't@t.dk' }
    password { '123456' }
    role { 0 }
    location_id { nil }
  end

  factory :admin, parent: :user do
    type { "Admin" }
  end

  factory :employee, parent: :user do
    type { "Employee" }
    association :location, factory: :unit
  end
end