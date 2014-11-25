require "test_helper"

class MgmtAgendaServedTest < Capybara::Rails::TestCase

  test "should block access without valid HTTP auth" do
    visit '/mgmt/agendas/new'
 
    assert_equal 401, page.status_code
  end

  test "agenda new" do
    login

    visit '/mgmt/agendas/new'
    assert_equal 200, page.status_code
    #puts page.body

    common_assert
    skip ('need better tests here...')
  end

  test "agenda new, click back button" do
    login
    
    visit '/mgmt/agendas/new'
    assert_equal 200, page.status_code

    click_on 'back'
    assert_equal 200, page.status_code
    assert_content page, "Number of Meetings"
  end

  test "agenda update" do
    login
    
    visit '/mgmt/agendas/1/edit'
    assert_equal 200, page.status_code

    assert_content page, "Update Agenda"
    skip ('need better tests here...')
  end

  test "agenda details" do
    login
    
    visit '/mgmt/agendas/1'
    assert_equal 200, page.status_code

    assert_content page, "Agenda Details"
    skip ('need better tests here...')
  end

  def common_assert
    assert_content page, "New Agenda"

    assert_not_nil first('form#new_agenda'), 'form with id "new agenda" should not be nil'
    assert_not_nil first('h2')
  end
end
