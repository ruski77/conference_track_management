require 'test_helper'

class UploadTalksControllerTest < ActionController::TestCase

  test "talks_upload" do
    talks = fixture_file_upload('files/input.txt','text/plain')

    refute_nil(talks, "Talks input file was nil")

    post :upload, file: talks

    assert :success
    assert_equal "Programming Conference Schedule Created!", flash[:notice]
  end

end
