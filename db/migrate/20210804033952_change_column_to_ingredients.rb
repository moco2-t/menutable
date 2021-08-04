class ChangeColumnToIngredients < ActiveRecord::Migration[6.1]
  def change
    remove_column :ingredients, :amount
    remove_column :ingredients, :food_id
    remove_column :ingredients, :unit
    add_column :ingredients, :amount, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
