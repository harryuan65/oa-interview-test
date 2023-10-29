# frozen_string_literal: true

FactoryBot.define do
  factory :teacher_student_follow_ship do
    association :teacher
    association :student
    created_at { Time.now }
    updated_at { Time.now }
  end
end
