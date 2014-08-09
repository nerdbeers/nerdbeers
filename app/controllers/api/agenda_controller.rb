class Api::AgendaController < ApplicationController

  def show
    meeting_date = params[:date].presence || Date.today.at_beginning_of_month

    agenda = Agenda.get_agenda(meeting_date) || Agenda.get_agenda(nil)

    pairings = [
                 { id: 1, topic: agenda.topic1, beer: agenda.beer1 },
                 { id: 2, topic: agenda.topic2, beer: agenda.beer2 },
                 { id: 3, topic: agenda.topic3, beer: agenda.beer3 },
               ]

    render json: {
                   id:           agenda.id,
                   meeting_date: agenda.meeting_date,
                   pairings:     pairings,
                   venue_name:   agenda.venue_name,
                   map_link:     agenda.map_link
                 }
  end

end
