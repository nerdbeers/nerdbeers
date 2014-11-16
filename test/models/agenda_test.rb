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

	test "update an agenda" do
		a = Agenda.find(1)
		assert_not_nil a

		b = Agenda.find(a.id)
		updateAgendaDetails b
		values_to_update = { topic1: b.topic1, topic2: b.topic2, topic3: b.topic3, beer1: b.beer1, beer2: b.beer2, beer3: b.beer3}
		b.update_attributes!(values_to_update)

		c = Agenda.find(b.id)

		assert_not_nil c
		assert a.topic1 != c.topic1, "Topic1 should not match"
		assert a.topic2 != c.topic2, "Topic2 should not match"
		assert a.topic3 != c.topic2, "Topic3 should not match"
		assert a.beer1  != c.beer1, "Beer1 should not match"
		assert a.beer2  != c.beer2, "Beer2 should not match"
		assert a.beer3  != c.beer3, "Beer3 should not match"
	end

end
