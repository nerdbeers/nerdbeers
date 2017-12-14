class VacuumWorker
  include Faktory::Job

  def perform(*args)
    ActiveRecord::Base.connection.execute 'vacuum analyze;'
  end
end