class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :name 
      t.string :unit
      t.string :keyword
      t.string :ancestry
      t.timestamps
    end
  end
end
