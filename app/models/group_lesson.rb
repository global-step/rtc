class GroupLesson < ApplicationRecord
    include Wisper::Publisher

    def fetch_lessons(lesson_id)
        # subscribe to lessons within next 24h sent from Gauss publish
        new_lessons = GroupLesson.new
        new_lessons.subscribe(  )
        # update view with latest lessons
        # using teacher_id to get name/gender - maybe Gauss side?
        # when lesson ends delete it and fetch the latest class info i.e. the next lesson moves to first place and a new lesson appears in last position
    end

    def reserve_lesson(lesson_id, student_id)
        # find lesson by lesson_id
        # + 1 to spaces taken
        # update view
        # if max spaces reached disable reserve button
        # publish student_id to Gauss
    end
end
