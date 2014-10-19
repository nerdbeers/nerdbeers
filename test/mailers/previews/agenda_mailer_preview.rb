# Preview all emails at http://localhost:3000/rails/mailers/agenda_mailer
class AgendaMailerPreview < ActionMailer::Preview
  
  def send_agenda
    AgendaMailer.send_agenda('rob@ideasrun.com')
  end

end
