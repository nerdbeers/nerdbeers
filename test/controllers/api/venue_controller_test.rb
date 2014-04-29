require 'test_helper'

class Api::VenueControllerTest < ActionController::TestCase

  test "should route to index" do
    assert_routing '/api/chapter/list.json', {controller: "api/chapter", action: "list", format: "json"}
  end

  test "should get list of venues" do
    get :list
    assert_response :success
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


#all_venues
