# frozen_string_literal: true

module Api
  module V1
    # TeachersController manages all teacher Rest APIs.
    class TeachersController < ApplicationController
      def list_followed_students
        students = Teachers::ListFollowedStudents.call(teacher_params[:id])

        render json: {
          students: students
        }
      end

      def follow_student
        Teachers::FollowStudent.call(teacher_params[:id], teacher_params[:student_id])

        head :created
      end

      def unfollow_student
        Teachers::UnfollowStudent.call(teacher_params[:id], teacher_params[:student_id])

        head :accepted
      end

      private

      def teacher_params
        params.permit(:id, :student_id)
      end
    end
  end
end
