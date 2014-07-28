class MgmtController < ApplicationController
  before_filter :authenticate#, only: [:blah]


  def list
    @agendas = Agenda.all
  end
  
  def detail
    @agenda = Agenda.joins(:venue).select('agendas.*, venues.venue as venue_name, venues.map_link as map_link').find(params[:id])
  end
  
  def updateagenda
    Agenda.update(params[:agenda_id], params[:topic1], params[:topic2], params[:topic3], params[:beer1], params[:beer2], params[:beer3])
    redirect_to controller: 'mgmt', action: 'list', status: 303
  end
  
  
  protected
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["MGMT_LOGIN"] && password == ENV["MGMT_PASSWORD"]
    end
  end
end
