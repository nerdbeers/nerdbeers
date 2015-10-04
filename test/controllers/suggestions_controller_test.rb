require "test_helper"

class SuggestionsControllerTest < ActionController::TestCase
  suggestions_path     = "/suggestions"
  suggestions_all_path = "/suggestions/all"
  suggestions_new_path = "/suggestions/new"

  def setup
    Suggestion.delete_all
    for i in 1..10
      s = Suggestion.new
      s.topic = "Topic #{i}"
      s.beer  = "Beer #{i}"
      s.save
    end
  end

  def teardown
  end

  test "controller is expected type" do
    assert @controller.is_a?(SuggestionsController), "should be a SuggestionsController"
    assert @controller.is_a?(ApplicationController), "should be an ApplicationController"
  end

  test "should get index" do
    # get(:index, {:viewing => :recent })
    get :index
    suggestions_index_common

    refute_array = [suggestions_new_path, suggestions_all_path]
    suggestions_path_assert_refute suggestions_path, refute_array, @request.original_fullpath

    rec_sugg = get_suggestions false
    all_sugg = get_suggestions true

    assert_not rec_sugg.count == all_sugg.count, "recent and all should not have same count"
    assert assigns(:suggestions).count == rec_sugg.count, "should have same count"
  end

  test "should get index all" do
    # get(:index, { :all => 'all', :viewing => :all })
    get :all
    suggestions_index_common

    refute_array = [suggestions_path, suggestions_new_path]
    suggestions_path_assert_refute suggestions_all_path, refute_array, @request.original_fullpath

    rec_sugg = get_suggestions false
    all_sugg = get_suggestions true

    assert_not rec_sugg.count == all_sugg.count, "recent and all should not have same count"
    assert assigns(:suggestions).count == all_sugg.count, "should have same count"
  end

  test "should get new" do
    get :new
    assert_response :success

    refute_array = [suggestions_path, suggestions_all_path]
    suggestions_path_assert_refute suggestions_new_path, refute_array, @request.original_fullpath

    assert_match /desktop/i, @request.variant.to_s
    assert_template "suggestions/new"
    assert_template layout: "layouts/application"
  end

  def suggestions_index_common
    assert_response :success
    assert_not_nil assigns(:suggestions), "suggestions should not be nil"
    assert_match /desktop/i, @request.variant.to_s
    assert_template "suggestions/_index"
    assert_template layout: "layouts/application"
  end

  def suggestions_path_assert_refute assert_path, refute_array, compare_path
    refute_array.each do |r|
      common_assert_refute assert_path, r, compare_path
    end
  end

  def get_suggestions all_suggestions
    s = Suggestion.most_recent_first
    all_suggestions == true ? s : s.take(5)
  end

end
