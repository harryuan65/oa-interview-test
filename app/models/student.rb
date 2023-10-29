# frozen_string_literal: true

# Students who can be followed by one or more teachers.
class Student < ApplicationRecord
  has_many :followed_ships, class_name: "TeacherStudentFollowShip"
  has_many :followers, through: :followed_ships, source: :teacher
end
