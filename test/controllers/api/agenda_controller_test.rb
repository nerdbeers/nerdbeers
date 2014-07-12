require 'test_helper'

class Api::AgendaControllerTest < ActionController::TestCase
  before do
    @agenda = agendas(:one)
    @venue = venues(:one)
  end

  test "should get latest agenda" do
    get :show
  	assert_response :success
    assert_equal Mime::JSON, response.content_type

    json = JSON.parse(@response.body)
    assert json.length > 0
  end

  test "should get past agenda" do
    params = {date: @agenda.meeting_date.to_date}
    get :show, params
  	assert_response :success
    assert_equal Mime::JSON, response.content_type

    json = JSON.parse(@response.body)
    assert json.length > 0
  end

  test "validate signature" do
    get :show
    assert_response :success
    
  	assert_response :success
    assert_equal Mime::JSON, response.content_type

    json = JSON.parse(@response.body)
    assert json.length > 0

    assert_equal @agenda.id, json['id']
    assert_equal @agenda.meeting_time, json['meeting_date']
    assert_equal @venue.venue, json['venue_name']
    assert_equal @venue.map_link, json['map_link']
    assert_equal 1, json['pairings'][0]['id']
    assert_equal @agenda.topic1, json['pairings'][0]['topic']
    assert_equal @agenda.beer1, json['pairings'][0]['beer']

    assert_equal 2, json['pairings'][1]['id']
    assert_equal @agenda.topic2, json['pairings'][1]['topic']
    assert_equal @agenda.beer2, json['pairings'][1]['beer']
    
    assert_equal 3, json['pairings'][2]['id']
    assert_equal @agenda.topic3, json['pairings'][2]['topic']
    assert_equal @agenda.beer3, json['pairings'][2]['beer']
  end

end

#{"id":13,"meeting_date":"Thu, June 19, 2013, 6:30 PM","pairings":[{"id":1,"topic":"raspberry pi projects","beer":"Avery - Ellies Brown Ale"},{"id":2,"topic":"vagrant+ansible dev machines","beer":"Avery - Out of Bounds Stout"},{"id":3,"topic":"unified logging solutions","beer":"Coop F5"}],"venue_name":"Redpin Bowling Lounge","map_link":"https://www.google.com/maps/place/RedPin+Bowling+Lounge/@35.463632,-97.509842,17z/data=!3m1!4b1!4m2!3m1!1s0x87b2172770ffab75:0x68464e5fb0c7350e?hl=en"}