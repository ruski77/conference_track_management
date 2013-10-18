module ProcessLine

  def retrieve_duration(line)

    index = line.index(/\d/)

    if index.nil?
      index = line.index(/lightning/)
    end

    if index.nil?
      return line
    end

    return line[index,line.length]

  end

  def determine_number_of_tracks talks_array

    total_duration = 0
    max_track_duration = 420.0

    talks_array.each do |talk|
      total_duration = total_duration + talk.duration
    end

    return (total_duration / max_track_duration).ceil

  end

end

