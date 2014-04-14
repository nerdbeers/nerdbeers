class Api::VenueController < ApplicationController

  def list
    venues = Venue.all
    render :json => venues, status: 200
  end

  def show
    venue = Venue.find(params[:id])
    render :json => venue, status: 200
    #render "api/v1/events/index", :formats => [:json], :handlers => [:jbuilder], status: 200
  end

end
