class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.integer :recipe_id
      t.integer :food_id
      t.string :amount

      t.timestamps
    end
  end
end