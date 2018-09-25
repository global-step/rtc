class CreateGroupLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :group_lessons do |t|
      t.integer :teacher_id
      t.integer :status
      t.integer :program_id
      t.datetime :start
      t.integer :max_seat
      t.integer :duration
      t.string :google_calendar_event_id
      t.integer :lesson_id
      t.boolean :teachable_within_24h
      t.integer :gsa_class_id

      t.timestamps
    end
  end
end
