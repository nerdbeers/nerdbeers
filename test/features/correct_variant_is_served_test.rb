require "test_helper"

class CorrectVariantIsServedTest < Capybara::Rails::TestCase
  test "desktop view is served correctly" do

    visit root_path

    assert_content page, "NerdBeers"
    assert_equal find('input#variant').value, "desktop"
  end

  test "mobile view is served correctly" do
  	page.driver.browser.header('User-Agent', 'can has mobile?')

    visit root_path

    assert_content page, "NerdBeers"
    assert_equal find('input#variant').value, "mobile"
  end

  test "tablet view is served correctly" do
  	page.driver.browser.header('User-Agent', 'can has ipad/tablet?')

    visit root_path

    assert_content page, "NerdBeers"
    assert_equal find('input#variant').value, "tablet"
  end
end
