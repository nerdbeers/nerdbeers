class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private
  def set_variant
    request.variant = :desktop
    request.variant = :mobile if request.user_agent =~ /Mobile/i
    request.variant = :tablet if request.user_agent =~ /iPad/i
  end
end