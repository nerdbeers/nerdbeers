class Api::RobotsController < ApplicationController
  before_action :authenticate
  
  def vacuum
    VacuumDbJob.new.async.perform()
    head 204
  end

  def clearmetrics
    ClearMetricsJob.new.async.perform()
    head 204
  end
  
  protected
    def authenticate
      authenticate_token || render_unauthorized
    end

    def authenticate_token
      authenticate_with_http_token do |token, options|
        token == ENV['HUBOT_TOKEN']
      end
    end

    def render_unauthorized
      self.headers['WWW-Authenticate'] = 'Token realm="Application"'
      render json: 'Bad credentials', status: 401
    end
end

# curl -H "Authorization: Token token=nerdbeers" http://localhost:3000/api/robots/vacuum
# curl -H "Authorization: Token token=nerdbeers" http://localhost:3000/api/robots/vacuum