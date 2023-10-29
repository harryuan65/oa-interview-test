# frozen_string_literal: true

RSpec.describe TeacherStudentFollowShip, type: :model do
  it { is_expected.to have_attr_accessor(:id) }
  it { is_expected.to have_attr_accessor(:teacher_id) }
  it { is_expected.to have_attr_accessor(:student_id) }
  it { is_expected.to have_attr_accessor(:created_at) }
  it { is_expected.to have_attr_accessor(:updated_at) }
  it { is_expected.to belong_to(:student).class_name("Student") }
  it { is_expected.to belong_to(:teacher).class_name("Teacher") }
end
