# frozen_string_literal: true

FactoryBot.define do
  factory :student do
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    gender { [true, false].sample }
    created_at { Time.now }
    updated_at { Time.now }
  end
end
