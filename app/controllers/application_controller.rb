class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private
  def set_variant
    case request.user_agent
    when /iPad/i
      request.variant = :tablet
    when /Android/i
      request.variant = :tablet
    when /iPhone/i
      request.variant = :mobile
    when /Android/i && /mobile/i
      request.variant = :mobile
    when /Windows Phone/i
      request.variant = :mobile
    end
  end
end