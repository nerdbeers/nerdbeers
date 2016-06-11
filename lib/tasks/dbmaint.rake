namespace :dbmaint do

  task :vacuum => :environment do
    if Time.now.to_date.strftime("%A") == 'Thursday'
      Rails.application.eager_load!
      VacuumDbJob.new.perform()
    end
  end

  task :clear_metrics => :environment do
    if Time.now.to_date.strftime("%A") == 'Friday'
      Rails.application.eager_load!
      ClearMetricsJob.new.perform()
    end
  end


  #https://gist.github.com/abstractcoder/5886291
  desc "Backs up heroku database and restores it locally"
    task restore_from_heroku: :environment do
      # Load the current environments database config
      c = Rails.configuration.database_configuration[Rails.env]

      Bundler.with_clean_env do
        # Capture new backup, delete oldest manual backup if limit reached
        `heroku pgbackups:capture --expire`
        # Download the backup to a file called latest.dump, consider adding this file to .gitignore
        `curl -o latest.dump \`heroku pgbackups:url\``
        # Restore the backup to the current environment's database
        `pg_restore --verbose --clean --no-acl --no-owner -h #{c["host"]} -U #{c["username"]} -d #{c["database"]} latest.dump`
      end
    end
end
