require 'test_helper'
require 'process_input_file'

class ProcessInputFileTest < ActiveSupport::TestCase

  def setup
    @instance = ProcessInputFile.new
  end

  test 'retrieve_duration' do

    result =  @instance.retrieve_duration('Writing Fast Tests Against Enterprise Rails 60min')
    assert_equal '60min', result, 'Did not find talk duration'

    result =  @instance.retrieve_duration('Rails for Python Developers lightning')
    assert_equal 'lightning', result, 'Did not find lightning duration'

    result =  @instance.retrieve_duration('Writing Fast Tests Against Enterprise Rails Sixty min')
    assert_equal 'Writing Fast Tests Against Enterprise Rails Sixty min', result, 'Did not find talk duration with text number lightning'

  end

  test 'convert_duration_to_number' do

    result = @instance.retrieve_duration_as_number('60min')
    assert_equal 60, result, 'Duration as number not returned'

    result = @instance.retrieve_duration_as_number('lightning')
    assert_equal 5, result, 'Duration for lightning not returned'

    result = @instance.retrieve_duration_as_number('light')
    assert_equal 0, result, 'Duration for lightning not returned'

  end

  test 'determine_number_of_tracks' do

    @talks_array = build_talks_array(3)
    result = @instance.determine_number_of_tracks(@talks_array)
    assert_equal 1, result, 'Incorrect number of tracks found'

    @talks_array = build_talks_array(10)
    result = @instance.determine_number_of_tracks(@talks_array)
    assert_equal 2, result, 'Incorrect number of tracks found'

  end

  test 'build_time' do

    result = @instance.build_time('09:00AM')
    time = Time.new(2013,10,16, 9,00,0, "+10:00")
    assert_equal time, result, 'Incorrect time created from input'

  end

  test 'get_hour_from_formatted_time' do

    result = @instance.get_hour_from_formatted_time('09:00AM')
    assert_equal '9', result, 'Incorrect hour returnd'

    result = @instance.get_hour_from_formatted_time('13:33AM')
    assert_equal '13', result, 'Incorrect hour returnd'

  end

  test 'get_minutes_from_formatted_time' do

    result = @instance.get_minutes_from_formatted_time('09:00AM')
    assert_equal '00', result, 'Incorrect minutes returned'

    result = @instance.get_minutes_from_formatted_time('5:47PM')
    assert_equal '47', result, 'Incorrect minutes returned'

  end

  test 'add_minutes_to_current_time' do

    time = Time.new(2013,10,16, 9,00,0, "+10:00")
    expected = Time.new(2013,10,16, 9,45,0, "+10:00")
    result = @instance.add_minutes_to_time(45, time)
    assert_equal expected, result, 'Adding minutes to current time incorrect'

  end

  test 'retrieve_formatted_time' do
    time = Time.new(2013,10,16, 9,45,0, "+10:00")
    result = @instance.retrieve_formatted_time(time)
    assert_equal '09:45AM', result, 'Formatted time was incorrect'
  end

  def build_talks_array(count)

    talks_array = Array.new

    count.times do
      talk = Talk.new
      talk.title = 'test title'
      talk.duration = @instance.retrieve_duration_as_number('60min')
      talks_array.push talk
    end

    return talks_array

  end

end