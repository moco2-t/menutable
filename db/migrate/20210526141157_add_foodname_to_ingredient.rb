class AddFoodnameToIngredient < ActiveRecord::Migration[6.1]
  def change
    add_column :ingredients, :foodname, :string
  end
end
