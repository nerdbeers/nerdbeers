require "test_helper"

class SuggestionsCorrectVariantIsServedTest < Capybara::Rails::TestCase
  test "suggestions desktop view is served correctly" do

    visit '/suggestion'

    assert_not_nil first('h3#suggestion-title')
    assert_equal "Recent Suggestions", find('h3#suggestion-title').text
    refute_equal "All Suggestions", find('h3#suggestion-title').text
    assert_nil first('p#suggestion-footer')
    assert_equal "desktop", find('input#variant').value
  end

  test "all suggestions desktop view is served correctly" do

    visit '/suggestion/all'

    assert_not_nil first('h3#suggestion-title')
    assert_equal "All Suggestions", find('h3#suggestion-title').text
    refute_equal "Recent Suggestions", find('h3#suggestion-title').text
    assert_nil first('p#suggestion-footer')
    assert_equal "desktop", find('input#variant').value
  end
end
