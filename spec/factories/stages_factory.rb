# frozen_string_literal: true

FactoryBot.define do
  factory :stage do
    title { 'MyString' }
    description { Faker::Lorem.paragraph_by_chars(number: 200) }
    location { 1 }
    tour

    trait :with_blank do
      title { '' }
      description { '' }
      location { '' }
    end

    trait :with_nil do
      title { nil }
      description { nil }
      location { nil }
    end
  end
end
