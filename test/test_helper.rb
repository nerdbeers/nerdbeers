ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
require "minitest/reporters"

require 'sucker_punch/testing/inline'

module Minitest
  module Reporters
    class AwesomeReporter < DefaultReporter
      GRAY = '0;36'
      GREEN = '1;32'
      RED = '1;31'

      def initialize(options = {})
        super
        @slow_threshold = options.fetch(:slow_threshold, nil)
      end

      def record_pass(test)
        if @slow_threshold.nil? || test.time <= @slow_threshold
          super
        else
          gray('O')
        end
      end

      def color_up(string, color)
        color? ? "\e\[#{ color }m#{ string }#{ ANSI::Code::ENDCODE }" : string
      end

      def red(string)
        color_up(string, RED)
      end

      def green(string)
        color_up(string, GREEN)
      end

      def gray(string)
        color_up(string, GRAY)
      end
    end
  end
end
reporter_options = { color: true, slow_count: 5 }
Minitest::Reporters.use! [Minitest::Reporters::AwesomeReporter.new(reporter_options)]

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  fixtures :all

  def json(body)
	  JSON.parse(body, symbolize_names: true)
  end

  def common_assert_refute assert_text, refute_text, compare_text
    assert_equal assert_text, compare_text
    refute_equal refute_text, compare_text
  end

  def updateAgendaDetails agenda
    agenda.topic1 = 'Topic Uno'
    agenda.topic2 = 'Topic Dos'
    agenda.topic3 = 'Topic Tres'
    agenda.beer1  = 'beer one'
    agenda.beer2  = 'beer two'
    agenda.beer3  = 'beer three'
  end

  def login
    basic_auth ENV['MGMT_LOGIN'], ENV['MGMT_PASSWORD']
  end
  # http://theadmin.org/articles/test-http-basic-authentication-in-rails/
  def basic_auth(name, password)
    if page.driver.respond_to?(:basic_auth)
      page.driver.basic_auth(name, password)
    elsif page.driver.respond_to?(:basic_authorize)
      page.driver.basic_authorize(name, password)
    elsif page.driver.respond_to?(:browser) && page.driver.browser.respond_to?(:basic_authorize)
      page.driver.browser.basic_authorize(name, password)
    else
      raise 'I do not know how to log in!'
    end
  end

end
