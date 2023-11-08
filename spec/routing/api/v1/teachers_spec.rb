# frozen_string_literal: true

describe Api::V1::TeachersController do
  describe "routing" do
    let(:teacher_id) { "1" }
    let(:student_id) { "1" }

    it "routes to #list_followed_students" do
      expect(get: "/api/v1/teachers/#{teacher_id}/followed_students").to route_to("api/v1/teachers#list_followed_students",
                                                                                  id: teacher_id)
    end

    it "routes to #follow_student" do
      expect(post: "/api/v1/teachers/#{teacher_id}/followed_students/#{student_id}").to route_to("api/v1/teachers#follow_student",
                                                                                   id: teacher_id, student_id: student_id)
    end

    it "routes to #unfollow_student" do
      expect(delete: "/api/v1/teachers/#{teacher_id}/followed_students/#{student_id}").to route_to("api/v1/teachers#unfollow_student",
                                                                                                   id: teacher_id,
                                                                                                   student_id: student_id)
    end
  end
end
