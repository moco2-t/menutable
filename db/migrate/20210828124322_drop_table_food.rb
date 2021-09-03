class DropTableFood < ActiveRecord::Migration[6.1]
  def change
    drop_table :foods
  end
end
