class Api::VenuesController < ApplicationController

  def index
    @venues = Venue.all
 #   render :json => venues, status: 200
    render "api/venues/index", formats: [:json], handlers: [:jbuilder], status: 200
  end

  def show
    @venue = Venue.find(params[:id])
#    render :json => venue, status: 200
    render "api/venues/show", formats: [:json], handlers: [:jbuilder], status: 200
  end

end
