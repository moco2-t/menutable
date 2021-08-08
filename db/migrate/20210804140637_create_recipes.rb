class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :keyword
      t.string :address

      t.timestamps
    end
  end
end
