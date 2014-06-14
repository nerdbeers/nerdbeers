class MgmtController < ApplicationController
  before_filter :authenticate#, only: [:blah]


  def list
    @agendas = Agenda.all
  end
  
  def detail
    @agenda = Agenda.joins(:venue).select('agendas.*, venues.venue as venue_name, venues.map_link as map_link').find(params[:id])
  end
  
  def updateagenda
  end
  
  
  protected
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "beer" && password == "code"
    end
  end
end
