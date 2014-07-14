class HomeController < ApplicationController
  def index

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
