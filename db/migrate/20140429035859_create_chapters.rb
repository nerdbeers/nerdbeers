class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :title, null: false
      t.timestamps
    end
  end
end
