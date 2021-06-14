class CreateMeals < ActiveRecord::Migration[6.1]
  def change
    create_table :meals do |t|
      t.date :date
      t.integer :recipe_id

      t.timestamps
    end
  end
end
