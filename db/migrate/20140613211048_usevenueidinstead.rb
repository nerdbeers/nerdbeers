class Usevenueidinstead < ActiveRecord::Migration
  def up
      execute('alter table agendas RENAME COLUMN location_id TO venue_id;')
  end
  
  def down
      execute('alter table agendas RENAME COLUMN venue_id TO location_id;')
  end
end
