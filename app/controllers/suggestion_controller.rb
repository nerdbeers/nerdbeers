class SuggestionController < ApplicationController

  before_action :set_variant

  def index
    @everything = params[:all].presence
    @suggestions = if @everything then Suggestion.all else Suggestion.last(5) end
    @suggestions = @suggestions.reverse
    Metric.log_viewport_stuff(request.variant, request.user_agent)
  end

  def new
    if request.post?
      @suggestion = Suggestion.new(suggestion_params)
      redirect_to controller: 'suggestion', action: 'index', status: 303 if @suggestion.save
    else
      Metric.log_viewport_stuff(request.variant, request.user_agent)
    end
  end

  private

  def suggestion_params
    params.require(:suggestion).permit(:topic, :beer)
  end

end
