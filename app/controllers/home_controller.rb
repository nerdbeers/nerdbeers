class HomeController < ApplicationController
  before_action :set_variant
  before_action :log_viewport_stuff

  def index
    @agenda = Agenda.get_agenda(params[:date])

    respond_to do |format|
        format.html          # /app/views/home/index.html.erb
        format.html.mobile   # /app/views/home/index.html+mobile.erb
        format.html.tablet   # /app/views/home/index.html+tablet.erb
    end
  end
end

  
