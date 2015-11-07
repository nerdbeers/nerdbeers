require 'test_helper'
class VenueTest < ActiveSupport::TestCase
  test "find a venue" do
    blah = Venue.find(1)
    assert_not_nil blah
    skip ('need to improve this test...')
  end

end
