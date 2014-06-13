require 'test_helper'

class AgendaTest < ActiveSupport::TestCase

	test "find an agenda" do
    blah = Agenda.find(1)
    assert_not_nil blah
	end
end
