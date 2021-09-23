class AddColumnToShoppings < ActiveRecord::Migration[6.1]
  def change
    add_column :shoppings, :end_date, :date
  end
end
