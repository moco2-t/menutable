class RemoveColumnUnitToMaterial < ActiveRecord::Migration[6.1]
  def change
     remove_column :materials, :unit
  end
end
