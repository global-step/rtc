json.extract! group_lesson, :id, :teacher_id, :status, :program_id, :start, :max_seat, :duration, :google_calendar_event_id, :lesson_id, :teachable_within_24h, :gsa_class_id, :created_at, :updated_at
json.url group_lesson_url(group_lesson, format: :json)
