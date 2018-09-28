# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_09_25_014757) do

  create_table "group_lessons", force: :cascade do |t|
    t.integer   "teacher_id"
    t.integer   "status"
    t.integer   "program_id"
    t.datetime  "start"
    t.integer   "max_seat"
    t.integer   "duration"
    t.string    "google_calendar_event_id"
    t.integer   "lesson_id"
    t.boolean   "teachable_within_24h"
    t.integer   "gsa_class_id"
    t.datetime  "created_at", null: false
    t.datetime  "updated_at", null: false
  end

  # create_table "gsa_classes", force: :cascade do |t|
  #   t.string    "title"
  #   t.integer   "spaces"
  #   t.datetime  "created_at", null: false
  #   t.datetime  "updated_at", null: false
  # end

end
