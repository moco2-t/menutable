class CreateMaterials < ActiveRecord::Migration[6.1]
  def change
    create_table :materials do |t|
      t.integer :recipe_id
      t.integer :food_id
      t.float :quantity
      t.string :unit

      t.timestamps
    end
  end
end
