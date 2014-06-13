class Createagendas < ActiveRecord::Migration
  def change
    create_table :agendas do |t|
      t.date  :meeting_date
      t.integer :location_id
      t.hstore :details
      t.timestamps
    end
  end
end
