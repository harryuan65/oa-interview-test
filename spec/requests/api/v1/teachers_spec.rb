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

  describe "POST /api/v1/teachers/:id/followed_students/:student_id" do
    context "when follow ship does not exist" do
      let(:teacher) { create(:teacher) }
      let(:student) { create(:student) }

      before { post("/api/v1/teachers/#{teacher.id}/followed_students/#{student.id}") }

      it "returns a created response" do
        expect(response).to have_http_status(201)
      end
    end

    context "when follow ship exists" do
      let(:ship) { create(:teacher_student_follow_ship) }

      before { post("/api/v1/teachers/#{ship.teacher_id}/followed_students/#{ship.student_id}") }

      it "returns a conflict response" do
        expect(response).to have_http_status(409)
      end
    end

    context "when the teacher does not exists" do
      let(:student) { create(:student) }

      before { post("/api/v1/teachers/123456/followed_students/#{student.id}") }

      it "returns a not found response" do
        expect(response).to have_http_status(404)
      end
    end

    context "when the student does not exists" do
      let(:teacher) { create(:teacher) }

      before { post("/api/v1/teachers/#{teacher.id}/followed_students/123456") }

      it "returns a not found response" do
        expect(response).to have_http_status(404)
      end
    end
  end
end
