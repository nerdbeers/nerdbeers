class HomeController < ApplicationController
  def index
    #meeting_date = params[:date].presence || Date.today.at_beginning_of_month
    @agenda = Agenda.get_agenda(params[:date])
  end
end
