class Api::RobotsController < ApplicationController
  skip_before_action :verify_authenticity_token
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
=begin
# curl -H "Authorization: Token token=nerdbeers" http://localhost:3000/api/robots/vacuum
# curl -H "Authorization: Token token=nerdbeers" http://localhost:3000/api/robots/vacuum

curl -H "Content-Type: application/json" -H "Authorization: token 804ef78pretendtoken8762" -X POST http://localhost:3000/api/robots/vacuum

curl -H "Authorization: Token token=nerdbeers" -X POST http://localhost:3000/api/robots/clearmetrics
curl -H "Authorization: Token token=nerdbeers" http://localhost:3000/api/robots/clearmetrics

curl --request POST -H "Authorization: Token token=nerdbeers" http://nerdbeers.com/api/robots/clearmetrics
curl -X POST -H "Authorization: Token token=nerdbeers" http://nerdbeers.com/api/robots/clearmetrics



curl -H "Authorization: Token token=nerdbeers" http://nerdbeers.com/api/robots/vacuum
=end