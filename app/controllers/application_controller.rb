class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def page_not_found
    respond_to do |format|
      format.html { render template: 'errors/not_found', layout: 'layouts/application', status: 404 }
      format.all  { render nothing: true, status: 404 }
    end
  end

  def server_error
    respond_to do |format|
      format.html { render template: 'errors/internal_server_error', layout: 'layouts/application', status: 500 }
      format.all  { render nothing: true, status: 500}
    end
  end

  def log_viewport_stuff
    unless ['ruby', 'sitewarm', 'newrelicpinger', 'googlebot', 'uptimerobot/2.0'].any? { |filter| request.user_agent.to_s.downcase.include?(filter) }
      Metric.log_viewport_stuff(request.variant, request.user_agent)
    end
  end


  private
  def set_variant
    request.variant = :desktop
    request.variant = :mobile if request.user_agent =~ /Mobile/i
    request.variant = :tablet if request.user_agent =~ /iPad/i
  end
end
