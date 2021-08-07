class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.string :foodname
      t.string :amount
      t.integer :recipe_id

      t.timestamps
    end
  end
end
