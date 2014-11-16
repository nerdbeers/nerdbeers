require 'test_helper'

class MetricTest < ActiveSupport::TestCase
  test "get the worthless metric" do
    message = Metric.get_metrics
    assert_equal message, 'hey metrics'
  end


  test "log a metric" do
    metric = Metric.log_viewport_stuff('tablet', 'tablet agent')
    last_metric = Metric.last
    assert_equal metric, last_metric
  end

end
