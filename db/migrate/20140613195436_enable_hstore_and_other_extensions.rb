class EnableHstoreAndOtherExtensions < ActiveRecord::Migration

  def self.up
    execute "CREATE EXTENSION IF NOT EXISTS hstore"
    execute 'CREATE EXTENSION IF NOT EXISTS pg_stat_statements'
  end

  def self.down
    execute "DROP EXTENSION IF EXISTS hstore"
    execute 'DROP EXTENSION IF EXISTS pg_stat_statements'
  end

end
