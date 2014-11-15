class HomeController < ApplicationController
  before_action :set_variant
  before_action :log_viewport_stuff


  respond_to do |format|
      format.html          # /app/views/home/index.html.erb
      format.html.mobile   # /app/views/home/index.html+mobile.erb
      format.html.tablet   # /app/views/home/index.html+tablet.erb
    end

  def index
    @agenda = Agenda.get_agenda(params[:date])
  end

  def event
    @agenda = Agenda.get_agenda(params[:date])
  end
end
