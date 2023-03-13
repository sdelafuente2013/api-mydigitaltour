# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    lastname { Faker::Name.last_name }
    email { Faker::Internet.email }
    role { %w[user guia admin].sample }
    status { [true, false].sample }

    factory :user_with_blank do
      name { '' }
      lastname { '' }
      email { '' }
      role { '' }
      status { '' }
    end

    factory :user_with_nil do
      name { nil }
      lastname { nil }
      email { nil }
      role { nil }
      status { nil }
    end

    factory :user_invalid_mail do
      email { 'ejemplosin-nada' }
    end

    factory :user_with_tours do
      name { 'ejemplo' }
      lastname { Faker::Name.last_name }
      email { Faker::Internet.email }
      role { %w[user guia admin].sample }
      status { true }
      password {  'ejemplosin123' }

      transient do
        tours_count { 2 }
      end

      after(:create) do |user, evaluator|
        create_list(:tour_with_stages, evaluator.tours_count, user: user)
      end
    end
  end
end
