require 'test_helper'
require 'session_builder'

class SessionBuilderTest < ActiveSupport::TestCase

  def setup
    @instance = SessionBuilder.new
  end

  test 'build_track_sessions' do

    @talks_array = build_talks_array(6)
    result = @instance.build_track_sessions(@talks_array)
    assert_equal 2, result.size, 'Incorrect amount of sessions allocated to track'

  end

  test 'build_morning_session' do

    @talks_array = build_talks_array(3)
    result = @instance.build_morning_session(@talks_array)
    assert_equal 3, result.size, 'Incorrect amount of talks allocated in morning session'

  end

  test 'build_afternoon_session' do

    @talks_array = build_talks_array(4)
    result = @instance.build_afternoon_session(@talks_array)
    assert_equal 4, result.size, 'Incorrect amount of talks allocated in afternoon session'

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