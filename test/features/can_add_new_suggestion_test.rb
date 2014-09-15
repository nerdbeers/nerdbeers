require "test_helper"

class CanAddNewSuggestionTest < Capybara::Rails::TestCase
  test "new suggestions desktop view is served correctly" do
    visit '/suggestions/new'

    common_assert_before_click
  end

  test "create new suggestion works as expected with both title and beer provided" do
    visit '/suggestions/new'

    fill_in 'Topic', :with => 'Any Topic'
    fill_in 'Beer', :with => 'Any Beer'

    common_save_success
  end

  test "create new suggestion works as expected with only topic provided" do
    visit '/suggestions/new'

    fill_in 'Topic', :with => 'Any Topic'

    common_save_success
  end

  test "create new suggestion works as expected with only beer provided" do
    visit '/suggestions/new'

    fill_in 'Beer', :with => 'Any Beer'

    common_save_success
  end

  test "create new suggestion confirm autocomplete suggests F5" do
    visit '/suggestions/new'

    fill_in 'Beer', :with => 'Any Beer'

    assert_not_nil first('input.nerdbeers-overflow-beer'), 'should be a beer input'
    #page.has_no_selector('input.nerdbeers-overflow-beer')
    #assert_not_nil first('input.ui-autocomplete-input'), 'should be an autocomplete input'
    page.has_selector?('input.ui-autocomplete-input')
    #assert_not_nil first('ul.ui-autocomplete'), 'should be autocomplete suggestion for F5'
    page.has_selector?('ul.ui-autocomplete li.ui-menu-item a')
    skip ('need to figure out how to test autocomplete')
  end

  test "create new suggestion with blank fields fails" do
    visit '/suggestions/new'
    common_save_fails
  end

  test "create new suggestion with whitespace fields fails" do
    visit '/suggestions/new'

    fill_in 'Topic', :with => ' '
    fill_in 'Beer', :with => ' '

    common_save_fails
  end

  def common_assert_before_click
    assert_content page, "New Suggestion"
    assert_not_nil first('#suggestion_topic')
    assert_not_nil first('#suggestion_beer')
  end

  def common_save_fails
    common_assert_before_click
    click_button 'Save Suggestion'
    assert current_path == '/suggestions/new', 'should remain at /suggestions/new if create new suggestion fails'
    assert_not_nil first('div.field_with_errors'), 'should be UI cue that error has occured'
    assert_not_nil first('div.how_to_fix_errors'), 'should be UI message to suggest remedy'
  end

  def common_save_success
    common_assert_before_click
    click_button 'Save Suggestion'
    assert current_path == '/suggestions', 'should redirect to /suggestions if successfully created new suggestion'
  end
end
