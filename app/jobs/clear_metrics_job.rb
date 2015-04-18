class ClearMetricsJob
  include SuckerPunch::Job

  def perform()
    Metric.delete_all("created_at < (now() - interval '3 months')")
    Shout.updateteam("We just deleted a bunch of crap in Metrics", 'databot')
  end
end