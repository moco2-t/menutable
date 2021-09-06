class AddColumnCriterionToFoods < ActiveRecord::Migration[6.1]
  def change
    add_column :foods, :criterion, :string
  end
end
