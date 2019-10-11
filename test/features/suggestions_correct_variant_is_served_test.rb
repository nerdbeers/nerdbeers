require "test_helper"

class SuggestionsCorrectVariantIsServedTest < Capybara::Rails::TestCase
  test "suggestions desktop view is served correctly" do

    visit '/suggestions'

    common_assert
    common_assert_refute "Recent Suggestions", "All Suggestions", find('h3#suggestion-title').text
  end

  test "all suggestions desktop view is served correctly" do

    visit '/suggestions/all'

    common_assert
    common_assert_refute  "All Suggestions", "Recent Suggestions", find('h3#suggestion-title').text
  end

  def common_assert
    assert_not_nil first('h3#suggestion-title')
    #assert_nil first('p#suggestion-footer')
    # assert_equal "desktop", find('input#variant').value
  end
end
