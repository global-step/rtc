require "application_system_test_case"

class GroupLessonsTest < ApplicationSystemTestCase
  setup do
    @group_lesson = group_lessons(:one)
  end

  test "visiting the index" do
    visit group_lessons_url
    assert_selector "h1", text: "Group Lessons"
  end

  test "creating a Group lesson" do
    visit group_lessons_url
    click_on "New Group Lesson"

    fill_in "Duration", with: @group_lesson.duration
    fill_in "Google Calendar Event", with: @group_lesson.google_calendar_event_id
    fill_in "Gsa Class", with: @group_lesson.gsa_class_id
    fill_in "Lesson", with: @group_lesson.lesson_id
    fill_in "Max Seat", with: @group_lesson.max_seat
    fill_in "Program", with: @group_lesson.program_id
    fill_in "Start", with: @group_lesson.start
    fill_in "Status", with: @group_lesson.status
    fill_in "Teachable Within 24h", with: @group_lesson.teachable_within_24h
    fill_in "Teacher", with: @group_lesson.teacher_id
    click_on "Create Group lesson"

    assert_text "Group lesson was successfully created"
    click_on "Back"
  end

  test "updating a Group lesson" do
    visit group_lessons_url
    click_on "Edit", match: :first

    fill_in "Duration", with: @group_lesson.duration
    fill_in "Google Calendar Event", with: @group_lesson.google_calendar_event_id
    fill_in "Gsa Class", with: @group_lesson.gsa_class_id
    fill_in "Lesson", with: @group_lesson.lesson_id
    fill_in "Max Seat", with: @group_lesson.max_seat
    fill_in "Program", with: @group_lesson.program_id
    fill_in "Start", with: @group_lesson.start
    fill_in "Status", with: @group_lesson.status
    fill_in "Teachable Within 24h", with: @group_lesson.teachable_within_24h
    fill_in "Teacher", with: @group_lesson.teacher_id
    click_on "Update Group lesson"

    assert_text "Group lesson was successfully updated"
    click_on "Back"
  end

  test "destroying a Group lesson" do
    visit group_lessons_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Group lesson was successfully destroyed"
  end
end
