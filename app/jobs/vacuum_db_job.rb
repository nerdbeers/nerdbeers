class VacuumDbJob
  include SuckerPunch::Job

  def perform()
    ActiveRecord::Base.connection.execute 'vacuum analyze;'
    # post to slack when it completes
    Shout.updateteam('vacuum has been completed', 'databot')
  end
end
