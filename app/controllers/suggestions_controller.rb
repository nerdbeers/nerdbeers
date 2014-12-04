class SuggestionsController < ApplicationController

  before_action :set_variant
  before_action :log_viewport_stuff, except: :create

  def index
    @suggestions = suggestions false 
    @viewing = params[:viewing]
  end

  def all
    @suggestions = suggestions true
    @viewing = params[:viewing]
  end

  def new
  end

  def create
    @suggestion = Suggestion.new(suggestion_params)

    if @suggestion.save
      Scream.updateteam('suggestions')
      redirect_to controller: 'suggestions', action: 'index', notice: 'Suggestion was successfully created.', status: 303
    end
  end

  private

  def suggestion_params
    params.require(:suggestion).permit(:topic, :beer)
  end

  def suggestions allSuggestions
    s = Suggestion.most_recent_first
    allSuggestions == true ? s : s.take(5)
  end

end
