class MgmtController < ApplicationController
  before_filter :authenticate#, only: [:blah]


  def list
    @agendas = Agenda.all
  end
  
  def detail
    @agenda = Agenda.find params[:id]
  end
  
  def updateagenda
    agenda = Agenda.find params[:agenda_id]

    values_to_update = [:topic1, :topic2, :topic3, :beer1, :beer2, :beer3]
                         .reduce({}) { |t, i| t.merge(i => params[i]) }
    agenda.update_attributes values_to_update

    redirect_to controller: 'mgmt', action: 'list', status: 303
  end
  
  
  protected
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "beer" && password == "code"
    end
  end
end
