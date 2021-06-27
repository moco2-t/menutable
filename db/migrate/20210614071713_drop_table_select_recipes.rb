class DropTableSelectRecipes < ActiveRecord::Migration[6.1]
  def change
    drop_table :select_recipes;
  end
end
