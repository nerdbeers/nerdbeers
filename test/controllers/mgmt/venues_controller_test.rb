require "test_helper"

class Mgmt::VenuesControllerTest < ActionController::TestCase
  before do
    @user = ENV["MGMT_LOGIN"]
    @password = ENV["MGMT_PASSWORD"]
    @venue = venues(:one)
  end

  test "should stop no credentials" do
    get :index
    assert_response 401
  end

  test "should get venue list" do

    @request.env['HTTP_AUTHORIZATION'] = 'Basic ' + Base64.encode64(@user + ':' + @password )
    get :index
    assert_response :success
    assert_template layout: "layouts/mgmt"
  end

  test "should get venue details" do
    @request.env['HTTP_AUTHORIZATION'] = 'Basic ' + Base64.encode64(@user + ':' + @password )
    params = {id: @venue.id }
    get :show, params
    assert_response :success
    assert_template layout: "layouts/mgmt"
  end

  test "should handle create an venue fails" do
    before = Venue.count()

    @request.env['HTTP_AUTHORIZATION'] = 'Basic ' + Base64.encode64(@user + ':' + @password )
    params = {venue: { venue: nil, map_link: nil}}
    post "create", params
    assert_response 200

    after = Venue.count()
    assert after == before, "Number of venues should remain the same"
  end

  test "should create an venue successfully" do
    before = Venue.count()
    venue_id = 1

    @request.env['HTTP_AUTHORIZATION'] = 'Basic ' + Base64.encode64(@user + ':' + @password )
    params = {venue: { venue: "Venue Uno", map_link: "http://nerdbeers.venueuno.com/" }}
    post "create", params
    assert_response 303

    after = Venue.count()
    assert after != before, "Number of venues should increase"
    assert after == before + 1, "Number of venues should increase by 1"

    v = Venue.last()
    assert_not_nil v, "new venue should not be nil"
    assert v.venue == "Venue Uno", "Venue should match"
    assert v.map_link == "http://nerdbeers.venueuno.com/", "map link should match"
  end

  test "should create, then delete an venue successfully" do
    before = Venue.count()

    @request.env['HTTP_AUTHORIZATION'] = 'Basic ' + Base64.encode64(@user + ':' + @password )
    params = {venue: { venue: "Venue Uno", map_link: "http://nerdbeers.venueuno.com/" }}
    post "create", params
    assert_response 303

    v = Venue.last()
    # puts "id: #{v.id}"
    after = Venue.count()
    assert after != before, "Number of venues should increase"
    assert after == before + 1, "Number of venues should increase by 1"

    @request.env['HTTP_AUTHORIZATION'] = 'Basic ' + Base64.encode64(@user + ':' + @password )
    params = {id: v.id}
    post "destroy", params
    assert_response 303

    after = Venue.count()
    assert after == before, "Number of venues should now be same as original"
  end

  test "should update venue" do
    @request.env['HTTP_AUTHORIZATION'] = 'Basic ' + Base64.encode64(@user + ':' + @password )
    params = {id: @venue.id,  venue: { venue: "Venue Uno", map_link: "http://nerdbeers.venueuno.com/" }}
    post "update", params
    assert_response 303

    v = Venue.find(@venue.id)
    assert_not_nil v, "updated venue should not be nil"
    assert v.id     == @venue.id, "venue id should match"

    assert v.venue == "Venue Uno", "Venue should match"
    assert v.map_link == "http://nerdbeers.venueuno.com/", "map link should match"

    # ensure we don't match original values
    assert v.venue    != @venue.venue, "Venue should not match"
    assert v.map_link != @venue.map_link, "Map Link should not match"
  end
end
