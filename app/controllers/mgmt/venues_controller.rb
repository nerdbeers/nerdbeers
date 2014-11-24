class Mgmt::VenuesController< Mgmt::MgmtController
  before_action :set_venue, only: [:edit, :update, :destroy]

  def index
    @venues = Venue.all.order("id DESC")
  end

  def show
    @venue = Venue.find(params[:id])
  end

  def new
    @venue = Venue.new
  end

  def edit
  end

  def create
    @venue = Venue.new(venue_params)

    if @venue.save
      redirect_to [:mgmt, @venue], notice: 'Venue was successfully created.', status: 201
    else
      render :new
    end
  end

  def update
    if @venue.update(venue_params)
      redirect_to [:mgmt, @venue], notice: 'Venue was successfully updated.', status: 303
    else
      render :edit
    end
  end

  def destroy
    @venue.destroy
    redirect_to mgmt_venues_url, notice: 'Venue was successfully destroyed.', status: 303
  end

  private

  def set_venue
    @venue = Venue.find(params[:id])
  end

  def venue_params
    params.require(:venue).permit(:venue, :map_link)
  end

end
