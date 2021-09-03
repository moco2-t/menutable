FactoryBot.define do
  factory :material do
    recipe_id { 1 }
    food_id { 1 }
    quantity { 1.5 }
    unit { "MyString" }
  end
end
