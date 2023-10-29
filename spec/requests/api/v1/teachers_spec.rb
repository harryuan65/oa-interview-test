# frozen_string_literal: true

RSpec.describe "Api::V1::Teachers", type: :request do
  describe "GET /api/v1/teachers/:id/followed_students" do
    context "when follow ships exist" do
      let(:teacher) { create(:teacher) }
      let(:ships) { create_list(:teacher_student_follow_ship, 5, teacher_id: teacher.id) }
      let!(:student_ids) { ships.map(&:student_id) }

      before do
        get("/api/v1/teachers/#{teacher.id}/followed_students")
      end

      it "returns a 200 response" do
        expect(response).to have_http_status(200)
      end

      it "returns a list of students followed by the teacher" do
        students = response.parsed_body["students"]
        ids = students.map { |student| student["id"] }
        expect(ids).to eq(student_ids)
      end
    end

    context "when follow ships do not exist" do
      let(:teacher) { create(:teacher) }

      before do
        get("/api/v1/teachers/#{teacher.id}/followed_students")
      end

      it "returns a 200 response" do
        expect(response).to have_http_status(200)
      end

      it "returns an empty list of students" do
        expect(response.parsed_body["students"]).to be_empty
      end
    end
  end
end
