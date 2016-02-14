class VacuumDbJob
  include SuckerPunch::Job

  def perform()
    # ActiveRecord::Base.connection_pool.with_connection do
      ActiveRecord::Base.connection.execute 'vacuum analyze;'
    # end
    # post to slack when it completes
    # Shout.updateteam('vacuum has been completed', 'databot')
  end
end
