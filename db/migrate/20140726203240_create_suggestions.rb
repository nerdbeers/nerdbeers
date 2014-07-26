class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.string :topic
      t.string :beer

      t.timestamps
    end
  end
end
