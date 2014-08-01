ENV['RACK_ENV']  = 'test'
ENV['RAILS_ENV'] = 'test'

require 'minitest/autorun'
require 'minitest/spec'
require File.expand_path(File.dirname(__FILE__) + '/../config/environment')
require 'mocha/setup'
