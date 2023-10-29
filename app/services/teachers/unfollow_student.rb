# frozen_string_literal: true

module Teachers
  #
  # UnfollowStudent allows a teacher to follow a student.
  #
  class UnfollowStudent
    include ActiveModel::Validations

    # @param [Integer] teacher_id : the subject teacher
    # @param [Integer] student_id : to student id to follow
    # @raise [ActiveRecord::RecordNotFound]
    def self.call(teacher_id, student_id)
      new(teacher_id, student_id).perform
    end

    def initialize(teacher_id, student_id)
      @teacher_id = teacher_id
      @student_id = student_id
    end

    def perform
      teacher = Teacher.find(@teacher_id)
      student = Student.find(@student_id)
      ship = TeacherStudentFollowShip.find_by!(teacher: teacher, student: student)
      ship.destroy

      nil
    end
  end
end
