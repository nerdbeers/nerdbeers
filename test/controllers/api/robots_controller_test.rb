require 'test_helper'

class Api::RobotsControllerTest < ActionController::TestCase

=begin
  test "Should fire off vacuum" do
    token = 'Token token="nerdbeers"'
    @request.env['HTTP_AUTHORIZATION'] = token
    # figure out how to test suckerpunch queue
    post :vacuum
    assert_response 204
  end
=end
  test "should fire off metrics" do
    token = 'Token token="nerdbeers"'
    @request.env['HTTP_AUTHORIZATION'] = token
    post :clearmetrics
    assert_response 204
  end

  test "bad auth token creates death" do
    token = 'Token token="death"'
    @request.env['HTTP_AUTHORIZATION'] = token
    post :vacuum
    assert_response 401
  end
end
