class ClearMetricsJob
  include SuckerPunch::Job

  def perform()
    Metric.delete_all("created_at < (now() - interval '3 months')")

    # check in with cronplete after job runs
    #if ENV["RAILS_ENV"] == "production"
    #  Net::HTTP.get(URI("http://api.cronplete.com/v1/checking/5b0425d8b640"))
    #end

    # Shout.updateteam('We just deleted a bunch of crap in Metrics', 'databot')
    Snitcher.snitch(ENV['METRICS_SNITCH_KEY'], message: 'Adios Metrics')
  end
end
