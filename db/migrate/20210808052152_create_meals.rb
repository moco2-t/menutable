class Createmeals < ActiveRecord::Migration[6.1]
  def change
    create_table :meals do |t|
      t.date :start_time
      t.integer :recipe_id

      t.timestamps
    end
  end
end
