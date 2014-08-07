class Agenda < ActiveRecord::Base
  belongs_to :venue
  store_accessor :details, :topic1, :topic2, :topic3, :beer1, :beer2, :beer3
  validates :meeting_date, presence: true
  
  def self.get_agenda(meetingdate)
    if meetingdate.present?
      Rails.cache.fetch(["recentagenda",meetingdate], :expires_in => 5.minutes) {
        Agenda.joins(:venue).select('agendas.*, venues.venue as venue_name, venues.map_link as map_link').find_by(:meeting_date => meetingdate)  
        }
    else
      Rails.cache.fetch("last_agenda", :expires_in => 5.minutes) {
        Agenda.joins(:venue).select('agendas.*, venues.venue as venue_name, venues.map_link as map_link').last
      }
    end
    
  end

=begin  
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
=end  
end

=begin
records = Agenda.joins(:venue).select('agendas.*, venues.venue as venue_name, venues.map_link as map_link').first.to_a

records.each do |thing|
  puts thing.id
  puts thing.venue_name
end
=end