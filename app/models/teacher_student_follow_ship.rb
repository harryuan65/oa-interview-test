# frozen_string_literal: true

# TeacherStudentFollowShip describes the relationship of a teacher following a student.
class TeacherStudentFollowShip < ApplicationRecord
  belongs_to :teacher
  belongs_to :student
end
