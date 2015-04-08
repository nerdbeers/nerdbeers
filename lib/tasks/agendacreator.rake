namespace :agendacreator do

  task :new => :environment do

    if Time.now.day == 1
      meeting_date = Chronic.parse("3rd thursday this #{Time.now.strftime("%B")}") + 6.hours
      tbd = "TBD"
      Agenda.create(meeting_date: meeting_date, venue_id: 6, topic1: tbd, topic2: tbd, topic3: tbd, beer1: tbd, beer2: tbd, beer3: tbd )
    end
  end
  
end