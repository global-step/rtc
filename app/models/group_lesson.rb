class GroupLesson < ApplicationRecord

    require 'bunny'
    
    connection = Bunny.new
    connection.start

    channel = connection.create_channel
    exchange = channel.fanout('logs')
    queue = channel.queue('', exclusive: true)

    queue.bind(exchange)

    teacher_name = ''

    puts ' [*] Waiting for logs. To exit press CTRL+BACKSLASH'

    begin
    queue.subscribe(block: true) do |_delivery_info, _properties, body|
        puts " [x] #{body}"
        teacher_name = body
        # CLOSE AFTER ONE
        channel.close
        connection.close
    end

    rescue Interrupt => _
    channel.close
    connection.close
    end

    GroupLesson.create!(
        teacher_id: 4, 
        status: 1, 
        program_id: 3, 
        start: '2018-09-27 14:45:00 UTC', 
        max_seat: 2, 
        duration: 25, 
        google_calendar_event_id: teacher_name, 
        lesson_id: 552, 
        teachable_within_24h: true, 
        gsa_class_id: 239
    ) 
    # if teachable_within_24h = true

    def fetch_lessons(lesson_id)
        # subscribe to lessons within next 24h sent from Gauss publish
        new_lessons = GroupLesson.new
        # update view with latest lessons
        # using teacher_id to get name/gender - maybe Gauss side?
        # when lesson ends delete it and fetch the latest class info i.e. the next lesson moves to first place and a new lesson appears in last position
    end

    def reserve_lesson(lesson_id, student_id)
        # find lesson by lesson_id
        # + 1 to spaces taken
        # update view`
        # if max spaces reached disable reserve button
        # publish student_id to Gauss
    end
end
