# frozen_string_literal: true

class CreateTeacherStudentFollowShips < ActiveRecord::Migration[6.1]
  def change
    create_table :teacher_student_follow_ships do |t|
      t.references :teacher, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.index %i[teacher_id student_id], unique: true

      t.timestamps
    end
  end
end
