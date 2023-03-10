# require 'faker'

FactoryBot.define do
  factory :stage do
    title { "MyString" }
    description { "MyString" }
    location { 1 }
    # tour { nil }

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
