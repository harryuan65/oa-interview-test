# frozen_string_literal: true

describe Teachers::FollowStudent, type: :service do
  context "when follow ship does not exist" do
    let(:teacher) { create(:teacher) }
    let(:student) { create(:student) }
    subject(:follow_student) { described_class.call(teacher.id, student.id) }

    it "creates a following ship" do
      expect { follow_student }.to change(TeacherStudentFollowShip, :count).from(0).to(1)
    end
  end

  context "when follow ship exists" do
    let(:ship) { create(:teacher_student_follow_ship) }
    subject(:follow_student) { described_class.call(ship.teacher_id, ship.student_id) }

    it "raises conflict error" do
      expect { follow_student }.to raise_error(ActiveRecord::RecordNotUnique)
    end
  end

  context "when the teacher does not exists" do
    let(:student) { create(:student) }
    subject(:follow_student) { described_class.call(100, student.id) }

    it "raises not found error and does not create a follow ship" do
      expect { follow_student }.to(
        raise_error(ActiveRecord::RecordNotFound).and(change(TeacherStudentFollowShip, :count).by(0))
      )
    end
  end

  context "when the student does not exists" do
    let(:teacher) { create(:teacher) }
    subject(:follow_student) { described_class.call(teacher.id, 100) }

    it "raises not found error and does not create a follow ship" do
      expect { follow_student }.to(
        raise_error(ActiveRecord::RecordNotFound).and(change(TeacherStudentFollowShip, :count).by(0))
      )
    end
  end
end
