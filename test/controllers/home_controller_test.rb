require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    
    assert_match /desktop/i, @request.variant.to_s #we have the correct variant
    assert_template "home/index"
    assert_template layout: "layouts/application"
  end

  test "should get index mobile variant" do
  	@request.user_agent = "i am a mobile user agent"
    get :index
    assert_response :success
    
    assert_match /mobile/i, @request.variant.to_s #we have the correct variant
    #assert_template "home/index+mobile" # but this isn't the correct view
    assert_template layout: "layouts/application"
  end

  test "should get index tablet variant" do
  	@request.user_agent = "i am an ipad"
    get :index
    assert_response :success
    
    assert_match /tablet/i, @request.variant.to_s #we have the correct variant
    #assert_template "home/index+tablet" # but this isn't the correct view
    assert_template layout: "layouts/application"
  end

end
