module TimeUtils

  def add_minutes_to_time(minutes, time)
    return time + (minutes * 60)
  end

  def retrieve_formatted_time(time)
    return time.strftime('%I:%M%p')
  end

  def build_time(time)

    time = Time.new(2013,10,16, get_hour_from_formatted_time(time),get_minutes_from_formatted_time(time),0, "+10:00")

    return time

  end

  def get_hour_from_formatted_time(val)

    index = val.index(/:/)

    hour = val[0,index]

    if hour.starts_with?('0')
      hour = hour[1,1]
    end

    return hour

  end

  def get_minutes_from_formatted_time(val)

    index = val.index(/:/)

    minutes = val[index+1,val.length]

    if minutes.end_with?('AM') || minutes.end_with?('PM')
      minutes = minutes[0,2]
    end

    return minutes

  end

end