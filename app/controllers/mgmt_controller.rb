class MgmtController < ApplicationController
  before_filter :authenticate#, only: [:blah]
  layout "mgmt"

  def list
    @agendas = Agenda.all.order("id DESC")
  end
  
  def detail
    @agenda = Agenda.joins(:venue).select('agendas.*, venues.venue as venue_name, venues.map_link as map_link').find(params[:id])
  end
  
  def updateagenda
    agenda = Agenda.find(params[:agenda_id])
    values_to_update = [:topic1, :topic2, :topic3, :beer1, :beer2, :beer3]
     .reduce({}) { |t, i| t.merge(i => params[i]) }
    agenda.update_attributes!(values_to_update)
    Rails.cache.delete(["agenda/",agenda.meeting_date])
    Rails.cache.delete("latest_agenda")

    Shout.updateteam("Agenda has been updated by MGMT")
    Scream.updateteam("agenda")
    redirect_to controller: 'mgmt', action: 'list', status: 303
  end
  
  
  protected
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["MGMT_LOGIN"] && password == ENV["MGMT_PASSWORD"]
    end
  end
end
