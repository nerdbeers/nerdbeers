class Mgmt::MgmtController < ApplicationController
  before_filter :authenticate
  layout "mgmt"

  protected
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["MGMT_LOGIN"] && password == ENV["MGMT_PASSWORD"]
    end
  end
end
