require 'test_helper'

class GroupLessonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group_lesson = group_lessons(:one)
  end

  test "should get index" do
    get group_lessons_url
    assert_response :success
  end

  test "should get new" do
    get new_group_lesson_url
    assert_response :success
  end

  test "should create group_lesson" do
    assert_difference('GroupLesson.count') do
      post group_lessons_url, params: { group_lesson: { duration: @group_lesson.duration, google_calendar_event_id: @group_lesson.google_calendar_event_id, gsa_class_id: @group_lesson.gsa_class_id, lesson_id: @group_lesson.lesson_id, max_seat: @group_lesson.max_seat, program_id: @group_lesson.program_id, start: @group_lesson.start, status: @group_lesson.status, teachable_within_24h: @group_lesson.teachable_within_24h, teacher_id: @group_lesson.teacher_id } }
    end

    assert_redirected_to group_lesson_url(GroupLesson.last)
  end

  test "should show group_lesson" do
    get group_lesson_url(@group_lesson)
    assert_response :success
  end

  test "should get edit" do
    get edit_group_lesson_url(@group_lesson)
    assert_response :success
  end

  test "should update group_lesson" do
    patch group_lesson_url(@group_lesson), params: { group_lesson: { duration: @group_lesson.duration, google_calendar_event_id: @group_lesson.google_calendar_event_id, gsa_class_id: @group_lesson.gsa_class_id, lesson_id: @group_lesson.lesson_id, max_seat: @group_lesson.max_seat, program_id: @group_lesson.program_id, start: @group_lesson.start, status: @group_lesson.status, teachable_within_24h: @group_lesson.teachable_within_24h, teacher_id: @group_lesson.teacher_id } }
    assert_redirected_to group_lesson_url(@group_lesson)
  end

  test "should destroy group_lesson" do
    assert_difference('GroupLesson.count', -1) do
      delete group_lesson_url(@group_lesson)
    end

    assert_redirected_to group_lessons_url
  end
end
