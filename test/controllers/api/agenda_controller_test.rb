require 'test_helper'

class Api::AgendaControllerTest < ActionController::TestCase

  test "should get latest agenda" do
    get :show
    assert_response :success
  end

  test "should get past agenda" do
    skip ('test for previous meeting')
  end

  test "validate signature" do
    skip ('get the lastest and confirm the structure of the agenda view')
  end

end
