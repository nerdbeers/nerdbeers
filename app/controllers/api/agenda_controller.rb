class Api::AgendaController < ApplicationController

  def show
    meeting_date = params[:date].presence || Date.today.at_beginning_of_month

    @rawr = Agenda.get_agenda(meeting_date)
    render "api/agenda/show", :formats => [:json], :handlers => [:jbuilder], status: 200
  end

end
