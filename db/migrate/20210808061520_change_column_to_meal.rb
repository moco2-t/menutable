class ChangeColumnTomeal < ActiveRecord::Migration[6.1]
  def change
    remove_column :meals, :start_time
    add_column :meals, :start_date, :date
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
