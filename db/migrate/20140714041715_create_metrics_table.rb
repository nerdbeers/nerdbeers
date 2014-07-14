class CreateMetricsTable < ActiveRecord::Migration
  def change
    create_table :metrics do |t|
      t.text :variant
      t.text :user_agent
      t.timestamps
    end
  end
end
