class Api::VenuesController < ApplicationController

  def index
    @venues = [Venue.new(venue: 'Republic Gastropub on Classen Curve')]
 #   render :json => venues, status: 200
    render "api/venues/index", :formats => [:json], :handlers => [:jbuilder], status: 200
  end

  def show
    @venue = Venue.new(venue: 'Republic Gastropub on Classen Curve')
#    render :json => venue, status: 200
    render "api/venues/show", :formats => [:json], :handlers => [:jbuilder], status: 200
  end

end
