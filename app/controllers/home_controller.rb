class HomeController < ApplicationController
  before_action :set_variant

  def index
    Metric.log_viewport_stuff(request.variant, request.user_agent)
    @agenda = Agenda.get_agenda(params[:date])
    
    respond_to do |format|
        format.html          # /app/views/home/index.html.erb
        format.html.mobile   # /app/views/home/index.html+mobile.erb
        format.html.tablet   # /app/views/home/index.html+tablet.erb
    end
  end

  def suggestion
    Metric.log_viewport_stuff(request.variant, request.user_agent)
    
    respond_to do |format|
        format.html          # /app/views/home/suggestion.html.erb
        format.html.mobile   # /app/views/home/suggestion.html+mobile.erb
        format.html.tablet   # /app/views/home/suggestion.html+tablet.erb
    end
  end
end

  