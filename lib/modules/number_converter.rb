module NumberConverter

  def retrieve_duration_as_number(duration)

    if duration.strip == 'lightning'
      return 5
    end

    index = duration.rindex(/\d/)

    if index.nil?
      return 0
    end

    return duration[0,index+1].to_i

  end

end