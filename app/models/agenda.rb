class Agenda < ActiveRecord::Base
  belongs_to :venue
  store_accessor :details, :topic1, :topic2, :topic3, :beer1, :beer2, :beer3
  
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
  
end

=begin
records = Agenda.joins(:venue).select('agendas.*, venues.venue as venue_name, venues.map_link as map_link').first.to_a

records.each do |thing|
  puts thing.id
  puts thing.venue_name
end
=end