require 'test_helper'

class MgmtControllerTest < ActionController::TestCase
  before do
    @user = 'beer'
    @password = 'code'
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

  end


  test "should get orders details" do
    @request.env['HTTP_AUTHORIZATION'] = 'Basic ' + Base64.encode64(@user + ':' + @password )
    params = {id: @agenda.id }
    get :detail, params
    assert_response :success
  end



end
