class Agenda < ApplicationRecord
  belongs_to :venue
  store_accessor :details, :topic1, :topic2, :topic3, :beer1, :beer2, :beer3
  validates :meeting_date, presence: true
  validates :venue_id, presence: true
  #after_commit :bust_cache, :notify_team
  after_commit :notify_team
  after_initialize :set_defaults

  def set_defaults
    self.meeting_date ||= Date.today
  end
  
  
  def self.get_agenda(meetingdate)
    if meetingdate.present?
      Agenda.joins(:venue).select('agendas.*, venues.venue as venue_name, venues.map_link as map_link').find_by(meeting_date: meetingdate)  
    else
      #Rails.cache.fetch("latest_agenda", expires_in: 5.minutes) {
        Agenda.joins(:venue).select('agendas.*, venues.venue as venue_name, venues.map_link as map_link').last
      #}
    end
    
  end

  def self.get_all
    #Rails.cache.fetch("all_agendas", expires_in: 5.minutes) {
      Agenda.joins(:venue).select('agendas.*, venues.venue as venue_name, venues.map_link as map_link')
    #}
  end


#  private
#  def bust_cache
#    Rails.cache.delete("latest_agenda")
#  end
  private 
  def notify_team
    Scream.updateteam("agenda")
  end
  

end
=begin
records = Agenda.joins(:venue).select('agendas.*, venues.venue as venue_name, venues.map_link as map_link').first.to_a

records.each do |thing|
  puts thing.id
  puts thing.venue_name
end
=end
