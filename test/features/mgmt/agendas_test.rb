require "test_helper"

class MgmtAgendaServedTest < Capybara::Rails::TestCase

  #http://theadmin.org/articles/test-http-basic-authentication-in-rails/
  def basic_auth(name, password)
    if page.driver.respond_to?(:basic_auth)
      page.driver.basic_auth(name, password)
    elsif page.driver.respond_to?(:basic_authorize)
      page.driver.basic_authorize(name, password)
    elsif page.driver.respond_to?(:browser) && page.driver.browser.respond_to?(:basic_authorize)
      page.driver.browser.basic_authorize(name, password)
    else
      raise "I don't know how to log in!"
    end
  end

  test "should block access without valid HTTP auth" do
    visit '/mgmt/agendas/new'
 
    assert_equal 401, page.status_code
  end

  test "agenda new" do
    basic_auth ENV["MGMT_LOGIN"], ENV["MGMT_PASSWORD"]
    
    visit '/mgmt/agendas/new'
    assert_equal 200, page.status_code
    #puts page.body

    common_assert
    skip ('need better tests here...')
  end

  def common_assert
    assert_content page, "New Agenda"

    assert_not_nil first('form#new_agenda'), 'form with id "new agenda" should not be nil'
    assert_not_nil first('h2')
  end
end
