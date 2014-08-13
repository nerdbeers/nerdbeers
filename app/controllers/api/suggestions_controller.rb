class Api::SuggestionsController < ApplicationController

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

end
