class Api::AgendaController < ApplicationController

  def show
    meeting_date = params[:date].presence || Date.today.at_beginning_of_month

    agenda = Agenda.get_agenda(meeting_date)
    if agenda.nil?
    	agenda =  Agenda.get_agenda(nil)
    end

    pairing1 = { :id => 1, :topic => agenda.topic1, :beer => agenda.beer1 }
    pairing2 = { :id => 2, :topic => agenda.topic2, :beer => agenda.beer2 }
    pairing3 = { :id => 3, :topic => agenda.topic3, :beer => agenda.beer3 }
    pairings = pairing1, pairing2, pairing3

    @rawr = {:id => agenda.id, :meeting_date => agenda.meeting_date, :pairings => pairings, :venue_name => agenda.venue_name, :map_link => agenda.map_link}
	render "api/agenda/show", :formats => [:json], :handlers => [:jbuilder], status: 200
  end

  def all
    @agendas = Array.new
    Agenda.get_all.each do |a|
        pairing1 = { :id => 1, :topic => a.topic1, :beer => a.beer1 }
        pairing2 = { :id => 2, :topic => a.topic2, :beer => a.beer2 }
        pairing3 = { :id => 3, :topic => a.topic3, :beer => a.beer3 }
        pairings = pairing1, pairing2, pairing3
        #need to join to venues to get venue_name and map_link
        @agendas.push({:id => a.id, :meeting_date => a.meeting_date, :pairings => pairings, :venue_name => a.venue_name, :map_link => a.map_link})
        #@agendas.push({:id => a.id, :meeting_date => a.meeting_date, :pairings => pairings})
    end

    render "api/agenda/all", :formats => [:json], :handlers => [:jbuilder], status: 200
  end
end
