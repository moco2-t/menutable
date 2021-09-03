class ChengeColumnToFoods < ActiveRecord::Migration[6.1]
  def change
    change_column :foods, :ancestry, :string
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
