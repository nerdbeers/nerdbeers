class Agenda < ActiveRecord::Base
  belongs_to :venue
  store_accessor :details, :topic1, :topic2, :topic3, :beer1, :beer2, :beer3, :meeting_time
  
  def self.get_agenda(meetingdate)
    if meetingdate.present?
      Agenda.joins(:venue).select('agendas.*, venues.venue as venue_name, venues.map_link as map_link').find_by(:meeting_date => meetingdate)  
    else
      Agenda.joins(:venue).select('agendas.*, venues.venue as venue_name, venues.map_link as map_link').last
    end
    
  end
  
  def self.create(meeting_date, location, topic1, topic2, topic3, beer1, beer2, beer3, meeting_time)
    agenda = Agenda.new
    agenda.meeting_date = meeting_date
    agenda.venue_id = location
    agenda.topic1 = topic1
    agenda.topic2 = topic2
    agenda.topic3 = topic3
    agenda.beer1 = beer1
    agenda.beer2 = beer2
    agenda.beer3 = beer3
    agenda.meeting_time = meeting_time
    agenda.save!
  end
  
  def self.update(agenda_id, topic1, topic2, topic3, beer1, beer2, beer3)
    agenda = Agenda.find(agenda_id)
    agenda.topic1 = topic1
    agenda.topic2 = topic2
    agenda.topic3 = topic3
    agenda.beer1 = beer1
    agenda.beer2 = beer2
    agenda.beer3 = beer3
    agenda.save!
  end
  
end

=begin
records = Agenda.joins(:venue).select('agendas.*, venues.venue as venue_name, venues.map_link as map_link').first.to_a

records.each do |thing|
  puts thing.id
  puts thing.venue_name
end
=end