FactoryBot.define do
  factory :tour do
    title { "MyString" }
    country { "MyString" }
    city { "MyString" }
    type_activity { "MyString" }
    price { 1 }
    user { nil }
  end

  factory :tour_with_blank do
    title { '' }
    country { '' }
    city { '' }
    type_activity { '' }
    price { '' }
    user { '' }

  end

  factory :tour_with_nil do
    title { nil }
    country { nil }
    city { nil }
    type_activity { nil }
    price { nil }
    user { nil }

  end
end
