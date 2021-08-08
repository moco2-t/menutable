class RemoveColumnToFoods < ActiveRecord::Migration[6.1]
  def change
    remove_column :foods, :key
  end
end
