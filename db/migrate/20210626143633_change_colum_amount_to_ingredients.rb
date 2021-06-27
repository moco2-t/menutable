class ChangeColumAmountToIngredients < ActiveRecord::Migration[6.1]
  def change
    change_column :ingredients, :amount, :integer
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
