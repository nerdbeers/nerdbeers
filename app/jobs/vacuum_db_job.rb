class VacuumDbJob
  include SuckerPunch::Job

  def perform()
    # ActiveRecord::Base.connection_pool.with_connection do
    ActiveRecord::Base.connection.execute 'vacuum analyze;'

    # check in with cronplete after job runs
    if ENV["RAILS_ENV"] == "production"
      Net::HTTP.get(URI("http://api.cronplete.com/v1/checking/c32e5cfcee77"))
    end
    # end
    # post to slack when it completes
  end
end
