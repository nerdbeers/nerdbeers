class SuggestionController < ApplicationController

  before_action :set_variant
  before_action :log_viewport_stuff, except: :create

  def index
    @everything = params[:all].presence
    @suggestions = if @everything then Suggestion.all else Suggestion.last(5) end
    @suggestions = @suggestions.reverse
    
    respond_to do |format|
        format.html          # /app/views/suggestion/index.html.erb
        format.html.mobile   # /app/views/suggestion/index.html+mobile.erb
        format.html.tablet   # /app/views/suggestion/index.html+tablet.erb
    end
  end

  def new
    if request.post?
      @suggestion = Suggestion.new(suggestion_params)
      redirect_to controller: 'suggestion', action: 'index', status: 303 if @suggestion.save
    end
  end

  private

  def suggestion_params
    params.require(:suggestion).permit(:topic, :beer)
  end

end

