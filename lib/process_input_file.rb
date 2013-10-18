require 'modules/process_line'
require 'modules/number_converter'
require 'modules/time_utils'

class ProcessInputFile
  include ProcessLine
  include NumberConverter
  include TimeUtils

  def process_line(line)

    title = line
    duration = retrieve_duration(line)

    talk = Talk.new
    talk.title = title
    talk.duration = retrieve_duration_as_number(duration)

    return talk

  end

end