require "test_helper"

class MgmtAgendaServedTest < Capybara::Rails::TestCase

  test "should block access without valid HTTP auth" do
    visit '/mgmt/agendas/new'
 
    assert_equal 401, page.status_code
  end

  test "agenda new" do
    date = DateTime.now.to_date
    v = Venue.last()
    assert_not_nil v, "venue should not be nil"
    venue_id = v.id

    login

    visit '/mgmt/agendas/new'
    assert_equal 200, page.status_code

    common_assert

    fill_in 'Meeting date', :with => date
    select v.venue, :from => 'agenda_venue_id'
    fill_in 'Topic1', :with => 'El Topic 1'    
    fill_in 'Topic2', :with => 'El Topic 2'    
    fill_in 'Topic3', :with => 'El Topic 3'    
    fill_in 'Beer1',  :with => 'La Brew 1'    
    fill_in 'Beer2',  :with => 'La Brew 2'    
    fill_in 'Beer3',  :with => 'La Brew 3'    

    click_on 'Create Agenda'
    assert_equal 200, page.status_code
    assert_content page, "Agenda Details"

    a = Agenda.last()
    assert_not_nil a, "new agenda should not be nil"
    assert a.meeting_date  == date, "meeting_date should match"
    assert a.venue_id  == venue_id, "venue_id should match"
    assert a.topic1 == "El Topic 1", "Topic1 should match"
    assert a.topic2 == "El Topic 2", "Topic2 should match"
    assert a.topic3 == "El Topic 3", "Topic3 should match"
    assert a.beer1  == "La Brew 1", "Beer1 should match"
    assert a.beer2  == "La Brew 2", "Beer2 should match"
    assert a.beer3  == "La Brew 3", "Beer3 should match"
  end

  test "agenda new, click back button" do
    login
    
    visit '/mgmt/agendas/new'
    assert_equal 200, page.status_code

    common_assert

    click_on 'back'
    assert_equal 200, page.status_code
    assert_content page, "Number of Meetings"
  end

  test "agenda update" do
    before = Agenda.find(1)
    assert_not_nil before, "agenda should not be nil"
    date = DateTime.now.to_date
    v = Venue.last()
    assert_not_nil v, "venue should not be nil"

    venue_id = v.id
    assert before.venue_id != venue_id, "agenda venue_id should not match venue_id"

    login
    
    visit '/mgmt/agendas/1/edit'
    assert_equal 200, page.status_code

    assert_content page, "Update Agenda"

    fill_in 'Meeting date', :with => date
    select v.venue, :from => 'agenda_venue_id'
    fill_in 'Topic1', :with => 'El Topic 1'    
    fill_in 'Topic2', :with => 'El Topic 2'    
    fill_in 'Topic3', :with => 'El Topic 3'    
    fill_in 'Beer1',  :with => 'La Brew 1'    
    fill_in 'Beer2',  :with => 'La Brew 2'    
    fill_in 'Beer3',  :with => 'La Brew 3'    

    click_on 'Update Agenda'
    assert_equal 200, page.status_code
    assert_content page, "Agenda Details"

    a = Agenda.find(before.id)
    assert_not_nil a, "agenda should not be nil"

    assert a.meeting_date  == date, "meeting_date should match"
    assert a.venue_id  == venue_id, "venue_id should match"

    assert a.meeting_date != before.meeting_date, "meeting_date should not match"
    assert a.venue_id != before.venue_id, "venue_id should not match"

    common_assert_refute "El Topic 1", before.topic1, a.topic1
    common_assert_refute "El Topic 2", before.topic2, a.topic2
    common_assert_refute "El Topic 3", before.topic3, a.topic3
    common_assert_refute "La Brew 1", before.beer1, a.beer1
    common_assert_refute "La Brew 2", before.beer2, a.beer2
    common_assert_refute "La Brew 3", before.beer3, a.beer3

    common_assert_refute date, before.meeting_date, a.meeting_date
    common_assert_refute venue_id, before.venue_id, a.venue_id
  end

  test "agenda details" do
    a = Agenda.last()
    assert_not_nil a, "agenda should not be nil"
    v = Venue.find(a.venue_id)
    assert_not_nil v, "venue should not be nil"

    login
    
    visit "/mgmt/agendas/#{a.id}"
    assert_equal 200, page.status_code

    assert_content page, "Agenda Details"

    assert_content page, a.topic1
    assert_content page, a.topic2
    assert_content page, a.topic3
    assert_content page, a.beer1
    assert_content page, a.beer2
    assert_content page, a.beer3
    assert_content page, v.venue
    assert_content page, a.meeting_date.strftime("%B %Y")
  end

  def common_assert
    assert_content page, "New Agenda"

    assert_not_nil first('form#new_agenda'), 'form with id "new agenda" should not be nil'
    assert_not_nil first('h2')
  end
end
