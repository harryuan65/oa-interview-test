# frozen_string_literal: true

# Teachers who can follow students.
class Teacher < ApplicationRecord
  has_many :followed_ships, class_name: "TeacherStudentFollowShip"
  has_many :followed_students, through: :followed_ships, source: :student
end
