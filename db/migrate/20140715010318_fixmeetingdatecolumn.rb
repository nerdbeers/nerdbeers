class Fixmeetingdatecolumn < ActiveRecord::Migration
  def up
    execute("alter table agendas alter column meeting_date type timestamp;")
    execute("update agendas SET meeting_date = (details->'meeting_time')::timestamp")
  end
end
