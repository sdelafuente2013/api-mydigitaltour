# frozen_string_literal: true

FactoryBot.define do
  factory :stage do
    title { 'MyString' }
    description { Faker::Lorem.paragraph_by_chars(number: 200) }
    location { 1 }
    tour

    factory :stage_with_blank do
      title { '' }
      description { '' }
      location { '' }
    end

    factory :stage_with_nil do
      title { nil }
      description { nil }
      location { nil }
    end
  end
end
