# frozen_string_literal: true

module Teachers
  #
  # FollowStudent allows a teacher to follow a student.
  #
  class ListFollowedStudents
    # @param [Integer] teacher_id: the subject teacher
    # @return [Array<Student>]
    # @raise [ActiveRecord::RecordNotFound]
    def self.call(teacher_id)
      new(teacher_id).perform
    end

    def initialize(teacher_id)
      @teacher_id = teacher_id
    end

    def perform
      teacher = Teacher.includes(:followed_students).find(@teacher_id)
      teacher.followed_students
    end
  end
end
