module UploadTalksHelper

  def lunch_time talk

    if talk.start_time == '01:00PM'
      return true
    end

    return false

  end

end
