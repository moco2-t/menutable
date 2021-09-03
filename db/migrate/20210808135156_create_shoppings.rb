class CreateShoppings < ActiveRecord::Migration[6.1]
  def change
    create_table :shoppings do |t|
      t.date :start_date
      t.integer :food_id
      t.float :quantity
      t.string :unit

      t.timestamps
    end
  end
end
