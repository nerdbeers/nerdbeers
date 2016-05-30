class VacuumDbJob
  include SuckerPunch::Job

  def perform()
    # ActiveRecord::Base.connection_pool.with_connection do
      ActiveRecord::Base.connection.execute 'vacuum analyze;'

      # check in with cronplete that the job ran
      Net::HTTP.get(URI("http://api.cronplete.com/v1/checking/c32e5cfcee77"))
    # end
    # post to slack when it completes
    # Shout.updateteam('vacuum has been completed', 'databot')
  end
end
