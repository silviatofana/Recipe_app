class AddRefrenceToRecipes < ActiveRecord::Migration[7.0]
  def change
    remove_index :recipes, column: [:users_id]
    remove_column :recipes, :users_id
    add_reference :recipes, :user, foreign_key: true
  end
end
