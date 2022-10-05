class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name, null: false
      t.string :measurement, null: false
      t.integer :price, null: false
      t.integer :quantity, null: false
      # t.references :user

      t.timestamps
    end
  end
end
