class ClearMetricsJob
  include SuckerPunch::Job

  def perform()
    Metric.delete_all("created_at < (now() - interval '3 months')")
  end
end