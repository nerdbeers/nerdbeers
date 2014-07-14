class HomeController < ApplicationController
  def index
    #meeting_date = params[:date].presence || Date.today.at_beginning_of_month
    request.variant = :desktop
    request.variant = :tablet if request.user_agent =~ /iPad/
    request.variant = :mobile if request.user_agent =~ /Mobile/
    Metric.log_viewport_stuff(request.variant, request.user_agent)
    
    @agenda = Agenda.get_agenda(params[:date])
  end

  respond_to do |format|
	format.html do |html|
	  html.tablet
	  html.mobile
	end
  end
end
