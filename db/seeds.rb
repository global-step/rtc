# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Teacher.create! name: 'Jonathan Worthington', gender: 'male'
# Teacher.create! name: 'Melissa Reed', gender: 'female'
# Teacher.create! name: 'Mariko Kuga', gender: 'female'
# Teacher.create! name: 'Kaito Nakamura', gender: 'male'

# ELA     = Teacher.create! name: 'Jonathan Worthington', gender: 'male'
# Maths = Teacher.create! name: 'Melissa Reed', gender: 'female'
# Roboticd  = Teacher.create! name: 'Mariko Kuga', gender: 'female'

GroupLesson.create! teacher_id: 4, status: 1, program_id: 3, start: '2018-09-25 12:45:00 UTC', max_seat: 2, duration: 25, google_calendar_event_id: '33as757', lesson_id: 552, teachable_within_24h: true, gsa_class_id: 234
GroupLesson.create! teacher_id: 1, status: 1, program_id: 2, start: '2018-09-25 13:10:00 UTC', max_seat: 6, duration: 25, google_calendar_event_id: '56as757', lesson_id: 564, teachable_within_24h: true, gsa_class_id: 236
GroupLesson.create! teacher_id: 3, status: 1, program_id: 1, start: '2018-09-25 13:35:00 UTC', max_seat: 4, duration: 25, google_calendar_event_id: '899s757', lesson_id: 566, teachable_within_24h: true, gsa_class_id: 239

# title: 'English Language', content: 'Introduction to grammar'