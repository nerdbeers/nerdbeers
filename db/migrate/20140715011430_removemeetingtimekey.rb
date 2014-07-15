class Removemeetingtimekey < ActiveRecord::Migration
  def up
    execute("update agendas SET details = delete(details, 'meeting_time')")
    execute("alter table agendas alter column meeting_date set not null;")
    
  end
end
