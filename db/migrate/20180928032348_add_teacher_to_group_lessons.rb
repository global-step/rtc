class AddTeacherToGroupLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :group_lessons, :teacher_name, :string
    add_column :group_lessons, :teacher_gender, :string
    add_column :group_lessons, :program_title, :string
    add_column :group_lessons, :lesson_title, :string
  end
end
