require 'test_helper'

class Api::VenuesControllerTest < ActionController::TestCase

  test "should get list of venues" do
    get :index
    assert_equal Mime::JSON, response.content_type
    json = JSON.parse(@response.body)
    assert json.length > 0
    first = json.first
    assert_equal 'Republic Gastropub on Classen Curve', first['venue']
  end
  
  test "should show of venues" do
    params = {id: 1}
    get :show, params
    assert_equal Mime::JSON, response.content_type
    json = JSON.parse(@response.body)
    assert_equal 'Republic Gastropub on Classen Curve', json['venue']
  end

end
