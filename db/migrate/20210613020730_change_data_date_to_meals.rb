class ChangeDataDateToMeals < ActiveRecord::Migration[6.1]
  def change
    change_column :meals, :date, :date
  end
end
