class Metric < ActiveRecord::Base

  def self.log_viewport_stuff(variant, user_agent)
    Metric.create(variant: variant, user_agent: user_agent)
  end

  def self. get_metrics
    p 'hey metrics'
  end

end
