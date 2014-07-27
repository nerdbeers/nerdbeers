require "test_helper"

class SuggestionControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    
    assert_match /desktop/i, @request.variant.to_s #we have the correct variant
    assert_template "suggestion/index"
    assert_template layout: "layouts/application"
    assert @response.body =~ /Recent Suggestions/i, "Content should say 'Recent Suggestions'"
  end

  test "should get index mobile variant" do
  	@request.user_agent = "i am a mobile user agent"
    get :index
    assert_response :success
    
    assert_match /mobile/i, @request.variant.to_s #we have the correct variant
    assert_template layout: "layouts/application"
    assert @response.body =~ /Recent Suggestions/i, "Content should say 'Recent Suggestions'"
  end

  test "should get index tablet variant" do
  	@request.user_agent = "i am an ipad"
    get :index
    assert_response :success
    
    assert_match /tablet/i, @request.variant.to_s #we have the correct variant
    assert_template layout: "layouts/application"
    assert @response.body =~ /Recent Suggestions/i, "Content should say 'Recent Suggestions'"
  end

  test "should get index all" do
  	@request.params[:all] = "all"
    get :index
    assert_response :success
    
    assert_match /desktop/i, @request.variant.to_s #we have the correct variant
    assert_template "suggestion/index"
    assert_template layout: "layouts/application"
    assert @response.body =~ /All Suggestions/i, "Content should say 'All Suggestions'"
  end

  test "should get index all mobile variant" do
  	@request.user_agent = "i am a mobile user agent"
  	@request.params[:all] = "all"
    get :index
    assert_response :success
    
    assert_match /mobile/i, @request.variant.to_s #we have the correct variant
    assert_template layout: "layouts/application"
    assert @response.body =~ /All Suggestions/i, "Content should say 'All Suggestions'"
  end

  test "should get index all tablet variant" do
  	@request.user_agent = "i am an ipad"
  	@request.params[:all] = "all"
    get :index
    assert_response :success
    
    assert_match /tablet/i, @request.variant.to_s #we have the correct variant
    assert_template layout: "layouts/application"
    assert @response.body =~ /All Suggestions/i, "Content should say 'All Suggestions'"
  end

  test "should get new" do
    get :new
    assert_response :success
    
    assert_match /desktop/i, @request.variant.to_s #we have the correct variant
    assert_template "suggestion/new"
    assert_template layout: "layouts/application"
    assert @response.body =~ /New Suggestion/i, "Content should say 'New Suggestion'"
  end

end
