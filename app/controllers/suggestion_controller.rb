class SuggestionController < ApplicationController

  before_action :set_variant
  before_action :log_viewport_stuff, except: :create

  def index
    @suggestions = if @everything = params[:all].presence
                     Suggestion.recent
                   else
                     Suggestion.recent.take(5)
                   end
  end

  def new
  end

  def create
    @suggestion = Suggestion.new(suggestion_params)
    redirect_to controller: 'suggestion', action: 'index', status: 303 if @suggestion.save
  end

  private

  def suggestion_params
    params.require(:suggestion).permit(:topic, :beer)
  end

end
