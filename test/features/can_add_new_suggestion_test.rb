require "test_helper"

class CanAddNewSuggestionTest < Capybara::Rails::TestCase
  test "new suggestions desktop view is served correctly" do

    visit '/suggestion/new'

    assert_content page, "New Suggestion"
    assert_not_nil first('#suggestion_topic')
    assert_not_nil first('#suggestion_beer')
    #assert_equal "desktop", find('input#variant').value
  end

  test "create new suggestion works as expected" do

    visit '/suggestion/new'

    assert_content page, "New Suggestion"
    assert_not_nil first('#suggestion_topic')
    assert_not_nil first('#suggestion_beer')
    skip 'finish this test - should redirect to /suggestion if successfully created new suggestion'
    #should redirect to /suggestion if successfully created new suggestion
    #assert_equal "desktop", find('input#variant').value
  end

  test "create new suggestion with blank fields fails" do

    visit '/suggestion/new'

    assert_content page, "New Suggestion"
    assert_not_nil first('#suggestion_topic')
    assert_not_nil first('#suggestion_beer')
    skip 'finish this test - should fail when fields are both left blank'
    #should redirect to /suggestion if successfully created new suggestion
    #assert_equal "desktop", find('input#variant').value
  end

  test "create new suggestion with whitespace fields fails" do

    visit '/suggestion/new'

    assert_content page, "New Suggestion"
    assert_not_nil first('#suggestion_topic')
    assert_not_nil first('#suggestion_beer')
    skip 'finish this test - should fail when fields are both whitespace only'
    #should redirect to /suggestion if successfully created new suggestion
    #assert_equal "desktop", find('input#variant').value
  end
end
