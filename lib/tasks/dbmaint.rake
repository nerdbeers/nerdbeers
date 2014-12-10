namespace :dbmaint do

  task :vacuum => :environment do
    if Time.now.to_date.strftime("%A") == 'Thursday'
      ActiveRecord::Base.connection.execute 'vacuum analyze;'
    
      # post to slack when it completes
      Shout.updateteam("vacuum has been completed", 'databot')
    end
  end
  
  task :clear_metrics => :environment do
    Metric.delete_all("created_at < (now() - interval '3 months')")
  end
  
end