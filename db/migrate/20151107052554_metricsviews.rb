class Metricsviews < ActiveRecord::Migration
  def change

    execute("CREATE OR replace view user_agent_hits_by_month
      AS
      SELECT date_part('month', created_at)::INTEGER AS month, variant AS type, count(0) AS hits
      FROM metrics
      WHERE user_agent NOT LIKE '%bot%' AND user_agent NOT ILIKE '%crawl%'
      GROUP BY date_part('month', created_at), variant")


    execute("CREATE OR replace view user_agent_hits
      AS
      SELECT user_agent, count(0) AS hits
      FROM metrics
      GROUP BY user_agent")
  end
end
