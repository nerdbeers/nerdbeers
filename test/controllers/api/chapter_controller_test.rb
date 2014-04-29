require 'test_helper'

class Api::ChapterControllerTest < ActionController::TestCase

  test "should get list of chapters" do
    get :list
    assert_response :success
  end

end
