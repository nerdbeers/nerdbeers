class AgendaMailer < ActionMailer::Base
  default from: "agenda@nerdbeers.com"
  
  def send_agenda(to_address)
    @agenda = Agenda.get_agenda(false)
    mail :to => to_address, :subject => "NerdBeers Official Agenda - #{@agenda.meeting_date.strftime("%B %Y")}"
  end
  
  
  
end
