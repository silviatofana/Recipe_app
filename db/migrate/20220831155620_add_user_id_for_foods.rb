class AddUserIdForFoods < ActiveRecord::Migration[7.0]
  def change
    add_reference :foods, :users, null: false, foreign_key: true
  end
end
