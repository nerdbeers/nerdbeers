require "test_helper"

class SuggestionsControllerTest < ActionController::TestCase
  suggestions_path     = "/suggestions"
  suggestions_all_path = "/suggestions/all"
  suggestions_new_path = "/suggestions/new"

  test "should get index" do
    get :index
    assert_response :success

    refute_array = [suggestions_new_path, suggestions_all_path]
    suggestions_path_assert_refute suggestions_path, refute_array, @request.original_fullpath

    assert_match /desktop/i, @request.variant.to_s #we have the correct variant
    assert_template "suggestions/index"
    assert_template layout: "layouts/application"
  end

  test "should get index all" do
    get(:index, { :all => 'all', :viewing => :all })
    assert_response :success

    refute_array = [suggestions_path, suggestions_new_path]
    suggestions_path_assert_refute suggestions_all_path, refute_array, @request.original_fullpath

    assert_match /desktop/i, @request.variant.to_s #we have the correct variant
    assert_template "suggestions/index"
    assert_template layout: "layouts/application"
  end

  test "should get new" do
    get :new
    assert_response :success
    
    refute_array = [suggestions_path, suggestions_all_path]
    suggestions_path_assert_refute suggestions_new_path, refute_array, @request.original_fullpath

    assert_match /desktop/i, @request.variant.to_s #we have the correct variant
    assert_template "suggestions/new"
    assert_template layout: "layouts/application"
  end

  def suggestions_path_assert_refute assert_path, refute_array, compare_path
    refute_array.each do |r|
      common_assert_refute assert_path, r, compare_path
    end
  end
end
