namespace :dbmaint do

  task :vacuum => :environment do
    ActiveRecord::Base.connection.execute 'vacuum verbose analyze;'
  end
  
end