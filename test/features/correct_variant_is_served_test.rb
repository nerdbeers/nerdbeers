require "test_helper"

class CorrectVariantIsServedTest < Capybara::Rails::TestCase
  test "desktop view is served correctly" do

    visit root_path

    assert_content page, "NerdBeers"
    assert_not_nil first('p#suggestion-footer')
    assert_equal "desktop", find('input#variant').value
  end

  test "mobile view is served correctly" do
    page.driver.browser.header('User-Agent', 'can has mobile?')

    visit root_path

    assert_content page, "NerdBeers"
    assert_not_nil first('p#suggestion-footer')
    assert_equal "mobile", find('input#variant').value
  end

  test "tablet view is served correctly" do
    page.driver.browser.header('User-Agent', 'can has ipad/tablet?')

    visit root_path

    assert_content page, "NerdBeers"
    assert_not_nil first('p#suggestion-footer')
    assert_equal "tablet", find('input#variant').value
  end

  test "suggestions desktop view is served correctly" do

    visit '/suggestion'

    assert_content page, "NerdBeers"
    assert_nil first('p#suggestion-footer')
    assert_equal "desktop", find('input#variant').value
  end

  test "suggestions mobile view is served correctly" do
    page.driver.browser.header('User-Agent', 'can has mobile?')

    visit '/suggestion'

    assert_content page, "NerdBeers"
    assert_nil first('p#suggestion-footer')
    assert_equal "mobile", find('input#variant').value
  end

  test "suggestions tablet view is served correctly" do
    page.driver.browser.header('User-Agent', 'can has ipad/tablet?')

    visit '/suggestion'

    assert_content page, "NerdBeers"
    assert_nil first('p#suggestion-footer')
    assert_equal "tablet", find('input#variant').value
  end
end
