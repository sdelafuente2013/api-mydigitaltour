# frozen_string_literal: true

FactoryBot.define do
  factory :tour do
    title { 'MyString' }
    country { 'MyString' }
    city { 'MyString' }
    type_activity { 'MyString' }
    price { 1 }
    user

    trait :with_blank do
      title { '' }
      country { '' }
      city { '' }
      type_activity { '' }
      price { '' }
    end

    trait :with_nil do
      title { nil }
      country { nil }
      city { nil }
      type_activity { nil }
      price { nil }
    end
  end
end
