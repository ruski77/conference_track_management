require 'modules/number_converter'
require 'modules/time_utils'
require 'modules/process_line'

class SessionBuilder
  include NumberConverter
  include TimeUtils
  include ProcessLine

  def build_track_sessions(talks_array)

    @talks = talks_array

    sessions = Array.new

    morning_session = Session.new
    morning_session.type = 'Morning'
    morning_session.talk = build_morning_session(@talks)
    sessions << morning_session

    afternoon_session = Session.new
    afternoon_session.type = 'Afternoon'
    afternoon_session.talk = build_afternoon_session(@talks)
    sessions << afternoon_session

    return sessions
  end

  def build_morning_session(talks_array)

    current_time = build_time('09:00')
    lunch = build_time('12:00')
    results = Array.new

    talks_array.each do |talk|

      if add_minutes_to_time(talk.duration, current_time) > lunch || talk.start_time != nil
        next
      end
      talk.start_time = retrieve_formatted_time(current_time)

      current_time = add_minutes_to_time(talk.duration, current_time)

      results << talk
    end

    return results

  end

  def build_afternoon_session(talks_array)

    current_time = build_time('13:00')
    network_event = build_time('17:00')
    results = Array.new

    talks_array.each do |talk|

      if add_minutes_to_time(talk.duration, current_time) > network_event || talk.start_time != nil
        next
      end
      talk.start_time = retrieve_formatted_time(current_time)

      current_time = add_minutes_to_time(talk.duration, current_time)

      results << talk
    end

    return results

  end


end