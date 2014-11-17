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
end
