require "test_helper"

class SuggestionsCorrectVariantIsServedTest < Capybara::Rails::TestCase
  test "suggestions desktop view is served correctly" do

    visit '/suggestion'

    assert_content page, "Recent Suggestions"
    assert_nil first('p#suggestion-footer')
    assert_equal "desktop", find('input#variant').value
  end

  test "suggestions mobile view is served correctly" do
    page.driver.browser.header('User-Agent', 'can has mobile?')

    visit '/suggestion'

    assert_content page, "Recent Suggestions"
    assert_nil first('p#suggestion-footer')
    assert_equal "mobile", find('input#variant').value
  end

  test "suggestions tablet view is served correctly" do
    page.driver.browser.header('User-Agent', 'can has ipad/tablet?')

    visit '/suggestion'

    assert_content page, "Recent Suggestions"
    assert_nil first('p#suggestion-footer')
    assert_equal "tablet", find('input#variant').value
  end

  test "all suggestions desktop view is served correctly" do

    visit '/suggestion/all'

    assert_content page, "All Suggestions"
    assert_nil first('p#suggestion-footer')
    assert_equal "desktop", find('input#variant').value
  end

  test "all suggestions mobile view is served correctly" do
    page.driver.browser.header('User-Agent', 'can has mobile?')

    visit '/suggestion/all'

    assert_content page, "All Suggestions"
    assert_nil first('p#suggestion-footer')
    assert_equal "mobile", find('input#variant').value
  end

  test "all suggestions tablet view is served correctly" do
    page.driver.browser.header('User-Agent', 'can has ipad/tablet?')

    visit '/suggestion/all'

    assert_content page, "All Suggestions"
    assert_nil first('p#suggestion-footer')
    assert_equal "tablet", find('input#variant').value
  end
end
