class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :kind
      t.string :name

      t.timestamps
    end
  end
end
