# frozen_string_literal: true

RSpec.describe Student, type: :model do
  it { is_expected.to have_attr_accessor(:id) }
  it { is_expected.to have_attr_accessor(:first_name) }
  it { is_expected.to have_attr_accessor(:last_name) }
  it { is_expected.to have_attr_accessor(:gender) }
  it { is_expected.to have_many(:followers).class_name("Teacher") }
end
