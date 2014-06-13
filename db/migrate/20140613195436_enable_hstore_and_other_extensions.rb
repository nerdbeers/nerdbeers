class EnableHstoreAndOtherExtensions < ActiveRecord::Migration
  def change
    execute 'CREATE EXTENSION hstore'
    execute 'CREATE EXTENSION pg_stat_statements'
    execute 'CREATE EXTENSION adminpack'
  end
end
