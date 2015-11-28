# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

task :test => ['test:all:db']

# desc "Setup the Rails linux ICQs"
# task :install do |t, args|
#  system "echo \"please see readme\" > icqchannel.md"
# end
