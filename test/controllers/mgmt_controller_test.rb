require 'test_helper'

class MgmtControllerTest < ActionController::TestCase
  before do
    @user = ENV["MGMT_LOGIN"]
    @password = ENV["MGMT_PASSWORD"]
    @agenda = agendas(:one)
  end

  test "should stop no credentils" do
    get :list
    assert_response 401
  end

  test "should get orders list" do
    
    @request.env['HTTP_AUTHORIZATION'] = 'Basic ' + Base64.encode64(@user + ':' + @password )
    get :list
    assert_response :success
    assert_template layout: "layouts/mgmt"

  end


  test "should get orders details" do
    @request.env['HTTP_AUTHORIZATION'] = 'Basic ' + Base64.encode64(@user + ':' + @password )
    params = {id: @agenda.id }
    get :detail, params
    assert_response :success
    assert_template layout: "layouts/mgmt"
  end

  test "should update agenda" do
    @request.env['HTTP_AUTHORIZATION'] = 'Basic ' + Base64.encode64(@user + ':' + @password )
    params = {agenda_id: @agenda.id, topic1: 'Topic Uno', topic2: 'Topic Dos', topic3: 'Topic Tres', beer1: 'beer uno', beer2: 'beer dos', beer3: 'beer tres' }
    post "updateagenda", params
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
