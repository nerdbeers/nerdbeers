class SuggestionController < ApplicationController

  before_action :set_variant

  def index
    @suggestions = if @everything = params[:all].presence
                     Suggestion.recent
                   else
                     Suggestion.recent.take(5)
                   end
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
