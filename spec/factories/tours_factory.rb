FactoryBot.define do
  factory :tour do
    title { "MyString" }
    country { "MyString" }
    city { "MyString" }
    type_activity { "MyString" }
    price { 1 }
    user { nil }
  end
end
