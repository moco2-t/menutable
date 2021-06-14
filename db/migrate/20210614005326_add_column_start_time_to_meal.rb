class AddColumnStartTimeToMeal < ActiveRecord::Migration[6.1]
  def change
    add_column :meals,:start_time,:datetime
  end
end
