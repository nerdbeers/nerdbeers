require "test_helper"

class AgendaMailerTest < ActionMailer::TestCase
  before do
    @agenda = Agenda.get_agenda(false)
    @email_addy = 'rob@datachomp.com'
  end

   test "agenda email Works" do
     mail = AgendaMailer.send_agenda(@email_addy)
     assert_equal "NerdBeers Official Agenda - #{@agenda.meeting_date.strftime("%B %Y")}", mail.subject
     assert_equal [@email_addy], mail.to
     assert_equal ["agenda@nerdbeers.com"], mail.from
     assert_match @agenda.topic1, mail.body.encoded
     assert_match @agenda.topic2, mail.body.encoded
     assert_match @agenda.topic3, mail.body.encoded
   end

end
