class ChengeColumnStartTimeToMeal < ActiveRecord::Migration[6.1]
  def change
    remove_column :meals, :meal_date
    remove_column :meals, :start_time
    add_column :meals,:start_time,:date
  end
end
