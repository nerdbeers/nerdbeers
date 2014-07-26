namespace :dbmaint do

  task :vacuum => :environment do
    ActiveRecord::Base.connection.execute 'vacuum analyze;'
  end
  
end