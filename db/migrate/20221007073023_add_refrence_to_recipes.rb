class AddRefrenceToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipes, :user, foreign_key: true
  end
end
