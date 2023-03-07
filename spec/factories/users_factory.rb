# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    lastname { Faker::Name.last_name }
    email { Faker::Internet.email }
    role { %w[admin user guide].sample }
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
  end


end
