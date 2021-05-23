class AddAncestryToFoods < ActiveRecord::Migration[6.1]
  def change
    add_column :foods, :ancestry, :string
    add_index :foods, :ancestry
  end
end
