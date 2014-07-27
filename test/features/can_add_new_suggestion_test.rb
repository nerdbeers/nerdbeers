require "test_helper"

class CanAddNewSuggestionTest < Capybara::Rails::TestCase
  test "new suggestions desktop view is served correctly" do

    visit '/suggestion/new'

    assert_content page, "New Suggestion"
    assert_not_nil first('#suggestion_topic')
    assert_not_nil first('#suggestion_beer')
    #assert_equal "desktop", find('input#variant').value
  end

  test "create new suggestion works as expected with both title and beer provided" do

    visit '/suggestion/new'

    assert_content page, "New Suggestion"
    assert_not_nil first('#suggestion_topic')
    assert_not_nil first('#suggestion_beer')
    fill_in 'Topic', :with => 'Any Topic'
    fill_in 'Beer', :with => 'Any Beer'
    click_button 'Save Suggestion'
    assert current_path == '/suggestion', 'should redirect to /suggestion if successfully created new suggestion'
  end

  test "create new suggestion works as expected with only topic provided" do

    visit '/suggestion/new'

    assert_content page, "New Suggestion"
    assert_not_nil first('#suggestion_topic')
    assert_not_nil first('#suggestion_beer')
    fill_in 'Topic', :with => 'Any Topic'
    click_button 'Save Suggestion'
    assert current_path == '/suggestion', 'should redirect to /suggestion if successfully created new suggestion'
  end

  test "create new suggestion works as expected with only beer provided" do

    visit '/suggestion/new'

    assert_content page, "New Suggestion"
    assert_not_nil first('#suggestion_topic')
    assert_not_nil first('#suggestion_beer')
    fill_in 'Beer', :with => 'Any Beer'
    click_button 'Save Suggestion'
    assert current_path == '/suggestion', 'should redirect to /suggestion if successfully created new suggestion'
  end

  test "create new suggestion with blank fields fails" do

    visit '/suggestion/new'

    assert_content page, "New Suggestion"
    assert_not_nil first('#suggestion_topic')
    assert_not_nil first('#suggestion_beer')
    click_button 'Save Suggestion'
    assert current_path == '/suggestion/new', 'should remain at /suggestion/new if create new suggestion fails'
    assert_not_nil first('div.field_with_errors'), 'should be UI cue that error has occured'
    assert_not_nil first('div.how_to_fix_errors'), 'should be UI message to suggest remedy'
  end

  test "create new suggestion with whitespace fields fails" do

    visit '/suggestion/new'

    assert_content page, "New Suggestion"
    assert_not_nil first('#suggestion_topic')
    assert_not_nil first('#suggestion_beer')
    fill_in 'Topic', :with => ' '
    fill_in 'Beer', :with => ' '
    click_button 'Save Suggestion'
    assert current_path == '/suggestion/new', 'should remain at /suggestion/new if create new suggestion fails'
    assert_not_nil first('div.field_with_errors'), 'should be UI cue that error has occured'
    assert_not_nil first('div.how_to_fix_errors'), 'should be UI message to suggest remedy'
  end
end
