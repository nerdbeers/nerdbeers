class Createforeignkeyforvenuesonagenda < ActiveRecord::Migration
  def up
    execute('ALTER TABLE agendas ADD CONSTRAINT fk_venue_id FOREIGN KEY (venue_id) REFERENCES venues;')
  end
  def down
    puts 'there is no going back'
    raise 'there is no going back'
  end
end
