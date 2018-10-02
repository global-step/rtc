class GroupLesson < ApplicationRecord

    require 'bunny'

    def self.fetch_lessons
        # subscribe to lessons within next 24h sent from Gauss publish
        # new_lessons = GroupLesson.new
        # update view with latest lessons
        # using teacher_id to get name/gender - maybe Gauss side?
        # when lesson ends delete it and fetch the latest class info i.e. the next lesson moves to first place and a new lesson appears in last position
        connection = Bunny.new
        connection.start

        channel = connection.create_channel
        channel.confirm_select
        exchange = channel.direct('gl')
        queue = channel.queue('group_lessons', durable: true, auto_delete: false)

        queue.bind(exchange)

        lesson_params = {}
        # teacher_params = {}
        # program = ''
        # lesson_title = ''

        puts ' [*] Waiting for logs. To exit press CTRL+BACKSLASH'

        begin
        queue.subscribe(manual_ack: true, block: true) do |_delivery_info, _properties, lesson |
            puts " [x] Received #{lesson}"
            lesson_params = JSON.load(lesson).to_hash
            # CLOSE AFTER ONE
            channel.close
            connection.close
        end

        rescue Interrupt => _
        channel.close
        connection.close
        end

        # create loop to create a new lesson for each lesson nested within the lesson hash
        # currently just creating one
        GroupLesson.create!(
            teacher_id:              lesson_params["id"],
            teacher_name:            lesson_params["name"],
            teacher_gender:          lesson_params["gender"],
            program_title:           lesson_params["program"],
            lesson_title:            lesson_params["lesson_title"],
            status:                  lesson_params["program"],  
            start:                   lesson_params["start"], 
            max_seat:                lesson_params["max_seat"], 
            duration:                lesson_params["duration"], 
            teachable_within_24h:    lesson_params["teachable_within_24h"], 
            google_calendar_event_id:lesson_params["google_calendar_event_id"]
        ) 
        # if teachable_within_24h = true
    end

    def reserve_lesson(lesson_id, student_id)
        # find lesson by lesson_id
        # + 1 to spaces taken
        # update view`
        # if max spaces reached disable reserve button
        # publish student_id to Gauss
    end
end
