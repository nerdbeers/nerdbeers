class Api::VenueController < ApplicationController

  def list
    @venues = Venue.all
 #   render :json => venues, status: 200
    render "api/venues/list", :formats => [:json], :handlers => [:jbuilder], status: 200
  end

  def show
    @venue = Venue.find(params[:id])
#    render :json => venue, status: 200
    render "api/venues/show", :formats => [:json], :handlers => [:jbuilder], status: 200
  end

end
