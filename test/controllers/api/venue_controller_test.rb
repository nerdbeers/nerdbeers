require 'test_helper'

class Api::VenueControllerTest < ActionController::TestCase

  test "should route to index" do
    assert_routing '/api/chapter/list.json', {controller: "api/chapter", action: "list", format: "json"}
  end

  test "should get list of venues" do
    get :list
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
  
=begin
  test "should get list of venues" do
    get :list
    assert_response :success
  end
=end

  #test "should show venue" do
  #  get :show, {'id' => "2"}
  #  assert_response :success
    #assert_not_nil assigns(:posts)
  #end


end