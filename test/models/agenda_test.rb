require 'test_helper'

class AgendaTest < ActiveSupport::TestCase

	test "find an agenda" do
    blah = Agenda.find(1)
    assert_not_nil blah
	end



	test "get this months agenda - no date" do
		blah = Agenda.get_agenda(nil)
		latest = Agenda.last
		assert_not_nil blah
		assert_equal latest, blah
	end

	test "get all agendas" do
		blah = Agenda.get_all
		assert_not_nil blah
		#assert_greater blah.count, 0
	end

end
