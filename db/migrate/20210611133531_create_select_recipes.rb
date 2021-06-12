class CreateSelectRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :select_recipes do |t|
      t.date :date
      t.integer :recipe1
      t.integer :recipe2
      t.integer :recipe3
      t.integer :recipe4
      t.integer :recipe5
      t.integer :recipe6
      t.integer :recipe7
      t.integer :recipe8
      t.integer :recipe9
      t.integer :recipe10

      t.timestamps
    end
  end
end
