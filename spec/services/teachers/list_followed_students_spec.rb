# frozen_string_literal: true

describe Teachers::ListFollowedStudents, type: :service do
  context "when follow ship does not exist" do
    let(:teacher) { create(:teacher) }
    subject(:list_followed_students) { described_class.call(teacher.id) }

    before do
      ships = create_list(:teacher_student_follow_ship, 5, teacher_id: teacher.id)
      @students = ships.map(&:student)
    end

    it "returns a list of students followed by the teacher" do
      expect(list_followed_students).to eq(@students)
    end
  end
end
