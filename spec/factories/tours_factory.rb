# frozen_string_literal: true

FactoryBot.define do
  factory :tour do
    title { 'MyString' }
    country { 'MyString' }
    city { 'MyString' }
    type_activity { 'MyString' }
    price { 1 }
    association :user, factory: :user

    factory :tour_with_blank do
      title { '' }
      country { '' }
      city { '' }
      type_activity { '' }
      price { '' }
    end

    factory :tour_with_nil do
      title { nil }
      country { nil }
      city { nil }
      type_activity { nil }
      price { nil }
    end

    factory :tour_with_stages do
      title { 'MyString' }
      country { 'MyString' }
      city { 'MyString' }
      type_activity { 'MyString' }
      price { 1 }

      transient do
        stages_count { 3 }
      end

      after(:create) do |tour, evaluator|
        create_list(:stage, evaluator.stages_count, tour: tour)
      end
    end
  end


end
