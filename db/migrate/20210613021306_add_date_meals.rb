class AddDateMeals < ActiveRecord::Migration[6.1]
  def change
    add_column :meals,:meal_date,:date
  end
end
