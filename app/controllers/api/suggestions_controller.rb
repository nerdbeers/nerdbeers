class Api::SuggestionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @suggestions = suggestions false
    render "api/suggestions/index", :formats => [:json], :handlers => [:jbuilder], status: 200
  end

  def all
    @suggestions = suggestions true
    render "api/suggestions/index", :formats => [:json], :handlers => [:jbuilder], status: 200
  end

  def show
    @suggestion = Suggestion.find(params[:id])
    render "api/suggestions/show", :formats => [:json], :handlers => [:jbuilder], status: 200
  end

  def suggestions allSuggestions
    s = Suggestion.most_recent_first
    allSuggestions == true ? s : s.take(5)
  end

  def create
    @suggestion = Suggestion.new(suggestion_params)
    if @suggestion.save
      @rawr = {:message => "Suggestion saved. :)"}
      render "api/suggestions/new", :formats => [:json], :handlers => [:jbuilder], status: 201
    else
      @rawr = {:message => "Suggestion save failed. :("}
      render "api/suggestions/new", :formats => [:json], :handlers => [:jbuilder], status: 400
    end
  end

  private

  def suggestion_params
    params.require(:suggestion).permit(:topic, :beer)
  end
end