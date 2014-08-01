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

  test "should get index all" do
    get(:index, { :all => '', :viewing => :all })
    assert_response :success

    assert_match /desktop/i, @request.variant.to_s #we have the correct variant
    assert_template "suggestion/index"
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
