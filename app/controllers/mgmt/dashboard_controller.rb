class Mgmt::DashboardController < Mgmt::MgmtController

  def index
    @agendas = Agenda.all.order("id DESC")
    @venues = Venue.all.order("id DESC")
  end

end
