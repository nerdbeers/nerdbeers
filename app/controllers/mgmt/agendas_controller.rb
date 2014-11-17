class Mgmt::AgendasController < Mgmt::MgmtController
  before_action :set_agenda, only: [:edit, :update, :destroy]

  def index
    @agendas = Agenda.get_all.order("id DESC")
  end

  def show
    @agenda = Agenda.joins(:venue).select('agendas.*, venues.venue as venue_name, venues.map_link as map_link').find(params[:id])
  end

  def new
    @agenda = Agenda.new
  end

  def edit
  end

  def create
    @agenda = Agenda.new(agenda_params)

    if @agenda.save
      redirect_to [:mgmt, @agenda], notice: 'Agenda was successfully created.', status: 201
    else
      render :new
    end
  end

  def update
    if @agenda.update(agenda_params)
      redirect_to [:mgmt, @agenda], notice: 'Agenda was successfully updated.', status: 303
    else
      render :edit
    end
  end

  def destroy
    @agenda.destroy
    redirect_to mgmt_agendas_url, notice: 'Agenda was successfully destroyed.', status: 303
  end

  private

  def set_agenda
    @agenda = Agenda.find(params[:id])
  end

  def agenda_params
    params.require(:agenda).permit(:topic1, :topic2, :topic3, :beer1, :beer2, :beer3, :meeting_date, :venue_id)
  end

end
