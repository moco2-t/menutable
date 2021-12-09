class ChangeColumnTomenu < ActiveRecord::Migration[6.1]
  def change
    remove_column :menus, :start_time
    add_column :menus, :start_date, :date
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
