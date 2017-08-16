class Api::AgendaController < ApplicationController

  def show
    meeting_date = params[:date].presence || Date.today.at_beginning_of_month

    agenda = Agenda.get_agenda(meeting_date)
    
    if agenda.nil?
    	agenda =  Agenda.get_agenda(nil)
    end

    pairings = buildPairings agenda

    @rawr = {id: agenda.id, meeting_date: agenda.meeting_date, pairings: pairings, venue_name: agenda.venue_name, map_link: agenda.map_link}
	render "api/agenda/show", formats: [:json], handlers: [:jbuilder], status: 200
  end

  def all
    unsorted = Array.new
    Agenda.get_all.each do |a|
        pairings = buildPairings a
        unsorted.push({id: a.id, meeting_date: a.meeting_date, perty_date: a.meeting_date.strftime("%b %d, %Y"), pairings: pairings, venue_name: a.venue_name, map_link: a.map_link})
    end

    # reversing the array is faster than sorting by negative date
    @agendas = unsorted.sort_by { |u| u[:meeting_date] }.reverse!

    render "api/agenda/all", :formats => [:json], :handlers => [:jbuilder], status: 200
  end

  def buildPairings agenda
    pairing1 = { id: 1, topic: agenda.topic1, beer: agenda.beer1 }
    pairing2 = { id: 2, topic: agenda.topic2, beer: agenda.beer2 }
    pairing3 = { id: 3, topic: agenda.topic3, beer: agenda.beer3 }
    pairings = pairing1, pairing2, pairing3
  end
end
