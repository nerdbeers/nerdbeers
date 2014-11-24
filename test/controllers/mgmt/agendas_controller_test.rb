require "test_helper"

class Mgmt::AgendasControllerTest < ActionController::TestCase
  before do
    @user = ENV["MGMT_LOGIN"]
    @password = ENV["MGMT_PASSWORD"]
    @agenda = agendas(:one)
  end
  
  test "should stop no credentials" do
    get :index
    assert_response 401
  end

  test "should get agenda list" do

    @request.env['HTTP_AUTHORIZATION'] = 'Basic ' + Base64.encode64(@user + ':' + @password )
    get :index
    assert_response :success
    assert_template layout: "layouts/mgmt"

  end

  test "should get agenda details" do
    @request.env['HTTP_AUTHORIZATION'] = 'Basic ' + Base64.encode64(@user + ':' + @password )
    params = {id: @agenda.id }
    get :show, params
    assert_response :success
    assert_template layout: "layouts/mgmt"
  end

  test "should handle create an agenda fails" do
    before = Agenda.count()
    date = DateTime.now.to_date
    venue_id = 1

    @request.env['HTTP_AUTHORIZATION'] = 'Basic ' + Base64.encode64(@user + ':' + @password )
    params = {agenda: { topic1: "Gonna Fail"}}
    post "create", params
    assert_response 200
    
    after = Agenda.count()
    assert after == before, "Number of agendas should remain the same"
  end

  test "should create an agenda successfully" do
    before = Agenda.count()
    date = DateTime.now.to_date
    venue_id = 1

    @request.env['HTTP_AUTHORIZATION'] = 'Basic ' + Base64.encode64(@user + ':' + @password )
    params = {agenda: { topic1: 'Topic Uno', topic2: 'Topic Dos', topic3: 'Topic Tres', beer1: 'beer uno', beer2: 'beer dos', beer3: 'beer tres', meeting_date: date, venue_id: venue_id  }}
    post "create", params
    assert_response 201
    
    after = Agenda.count()
    assert after != before, "Number of agendas should increase"
    assert after == before + 1, "Number of agendas should increase by 1"

    a = Agenda.last()
    assert_not_nil a, "new agenda should not be nil"
    assert a.topic1 == "Topic Uno", "Topic1 should match"
    assert a.topic2 == "Topic Dos", "Topic2 should match"
    assert a.topic3 == "Topic Tres", "Topic3 should match"
    assert a.beer1  == "beer uno", "Beer1 should match"
    assert a.beer2  == "beer dos", "Beer2 should match"
    assert a.beer3  == "beer tres", "Beer3 should match"
    assert a.meeting_date  == date, "meeting_date should match"
    assert a.venue_id  == venue_id, "venue_id should match"
  end

  test "should create, then delete an agenda successfully" do
    before = Agenda.count()
    date = DateTime.now.to_date
    venue_id = 1

    @request.env['HTTP_AUTHORIZATION'] = 'Basic ' + Base64.encode64(@user + ':' + @password )
    params = {agenda: { topic1: 'Topic Uno', topic2: 'Topic Dos', topic3: 'Topic Tres', beer1: 'beer uno', beer2: 'beer dos', beer3: 'beer tres', meeting_date: date, venue_id: venue_id  }}
    post "create", params
    assert_response 201

    a = Agenda.last()
    puts "id: #{a.id}"    
    after = Agenda.count()
    assert after != before, "Number of agendas should increase"
    assert after == before + 1, "Number of agendas should increase by 1"

    @request.env['HTTP_AUTHORIZATION'] = 'Basic ' + Base64.encode64(@user + ':' + @password )
    params = {id: a.id}
    post "destroy", params
    assert_response 303

    after = Agenda.count()
    assert after == before, "Number of agendas should now be same as original"
  end

  test "should update agenda" do
    @request.env['HTTP_AUTHORIZATION'] = 'Basic ' + Base64.encode64(@user + ':' + @password )
    params = {id: @agenda.id, agenda: { topic1: 'Topic Uno', topic2: 'Topic Dos', topic3: 'Topic Tres', beer1: 'beer uno', beer2: 'beer dos', beer3: 'beer tres', meeting_date: '2014-11-01', venue_id: 1 }}
    post "update", params
    assert_response 303

    a = Agenda.find(@agenda.id)
    assert_not_nil a, "updated agenda should not be nil"
    assert a.id     == @agenda.id, "agenda id should match"
    
    assert a.topic1 == "Topic Uno", "Topic1 should match"
    assert a.topic2 == "Topic Dos", "Topic2 should match"
    assert a.topic3 == "Topic Tres", "Topic3 should match"
    assert a.beer1  == "beer uno", "Beer1 should match"
    assert a.beer2  == "beer dos", "Beer2 should match"
    assert a.beer3  == "beer tres", "Beer3 should match"
    
    #ensure we don't match original values
    assert a.topic1 != @agenda.topic1, "Topic1 should not match"
    assert a.topic2 != @agenda.topic2, "Topic2 should not match"
    assert a.topic3 != @agenda.topic2, "Topic3 should not match"
    assert a.beer1  != @agenda.beer1, "Beer1 should not match"
    assert a.beer2  != @agenda.beer2, "Beer2 should not match"
    assert a.beer3  != @agenda.beer3, "Beer3 should not match"
  end
end
