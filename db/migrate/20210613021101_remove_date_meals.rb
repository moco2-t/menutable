class RemoveDateMeals < ActiveRecord::Migration[6.1]
  def change
    remove_column :meals, :date
  end
end
