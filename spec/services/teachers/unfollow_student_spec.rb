# frozen_string_literal: true

describe Teachers::UnfollowStudent, type: :service do
  context "when a follow ship exists" do
    let!(:ship) { create(:teacher_student_follow_ship) }
    let(:teacher_id) { ship.teacher_id }
    let(:student_id) { ship.student_id }
    subject(:unfollow_student) { described_class.call(teacher_id, student_id) }

    it "destroys a following ship" do
      expect { unfollow_student }.to change(TeacherStudentFollowShip, :count).by(-1)
    end
  end

  context "when a follow ship does not exist" do
    let(:teacher) { create(:teacher) }
    let(:student) { create(:student) }
    subject(:unfollow_student) { described_class.call(teacher.id, student.id) }

    it "raises not found error" do
      expect { unfollow_student }.to(
        raise_error(ActiveRecord::RecordNotFound).and(change(TeacherStudentFollowShip, :count).by(0))
      )
    end
  end
end
