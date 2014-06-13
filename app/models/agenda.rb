class Agenda < ActiveRecord::Base
  store_accessor :details, :topic1, :topic2, :topic3, :beer1, :beer2, :beer3
  
  
  def self.create(date, location, topic1, topic2, topic3, beer1, beer2, beer3)
    agenda = Agenda.new
    agenda.meeting_date = date
    agenda.location_id = location
    agenda.topic1 = topic1
    agenda.topic2 = topic2
    agenda.topic3 = topic3
    agenda.beer1 = beer1
    agenda.beer2 = beer2
    agenda.beer3 = beer3
    agenda.save!
  end
  
end
