require "test_helper"

class MgmtVenueServedTest < Capybara::Rails::TestCase

  test "should block access without valid HTTP auth" do
    visit '/mgmt/venues/new'
 
    assert_equal 401, page.status_code
  end

  test "venue new" do
    login
    
    visit '/mgmt/venues/new'
    assert_equal 200, page.status_code

    common_assert
    
    fill_in 'Venue', :with => 'My Venue'
    fill_in 'Map link', :with => 'http://myvenue.com/'
    click_on 'Create Venue'
    assert_equal 200, page.status_code
    assert_content page, "Venue Details"

    v = Venue.last()
    assert_not_nil v, "new venue should not be nil"
    assert v.venue == "My Venue", "Venue should match"
    assert v.map_link == "http://myvenue.com/", "map link should match"
  end

  test "venue new, click back button" do
    login
    
    visit '/mgmt/venues/new'
    assert_equal 200, page.status_code

    common_assert

    click_on 'back'
    assert_equal 200, page.status_code
    assert_content page, "Number of Venues"
  end

  test "venue update" do
    login
    
    before = Venue.find(1)
    assert_not_nil before, "venue should not be nil"

    visit '/mgmt/venues/1/edit'
    assert_equal 200, page.status_code

    assert_content page, "Update Venue"

    fill_in 'Venue', :with => 'My Venue'
    fill_in 'Map link', :with => 'http://myvenue.com/'
    click_on 'Update Venue'
    assert_equal 200, page.status_code
    assert_content page, "Venue Details"

    v = Venue.find(1)
    assert_not_nil v, "venue should not be nil"
    common_assert_refute "My Venue", before.venue, v.venue
    common_assert_refute "http://myvenue.com/", before.map_link, v.map_link
  end

  test "venue details" do
    login
    
    visit '/mgmt/venues/1'
    assert_equal 200, page.status_code

    assert_content page, "Venue Details"

    v = Venue.find(1)
    assert_not_nil v, "venue should not be nil"
    assert_content page, v.venue
    assert_content page, v.map_link
  end

  def common_assert
    assert_content page, "New Venue"

    assert_not_nil first('form#new_venue'), 'form with id "new venue" should not be nil'
    assert_not_nil first('h2')
  end
end
