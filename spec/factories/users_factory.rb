# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    email { Faker::Internet.email }
    role { 'guia' }
    status { false }
    password { 'passwordExample123' }

    trait :with_blank do
      name { '' }
      lastname { '' }
      email { '' }
      role { '' }
      status { '' }
    end

    trait :with_nil do
      name { nil }
      lastname { nil }
      email { nil }
      role { nil }
      status { nil }
    end

    trait :invalid_mail do
      email { 'ejemplosin-nada' }
    end
  end
end
