FactoryBot.define do
  factory :shopping do
    start_date { "2021-08-08" }
    food_id { 1 }
    quantity { 1.5 }
    unit { "MyString" }
  end
end
