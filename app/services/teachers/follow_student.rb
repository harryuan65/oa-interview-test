# frozen_string_literal: true

module Teachers
  #
  # FollowStudent allows a teacher to follow a student.
  #
  class FollowStudent
    include ActiveModel::Validations

    # @param [Integer] teacher_id : the subject teacher
    # @param [Integer] student_id : to student id to follow
    # @raise [ActiveRecord::RecordInvalid, ActiveRecord::RecordNotUnique]
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
      TeacherStudentFollowShip.create!(teacher: teacher, student: student)

      nil
    end
  end
end
