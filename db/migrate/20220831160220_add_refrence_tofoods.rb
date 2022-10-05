class AddRefrenceTofoods < ActiveRecord::Migration[7.0]
  def change
     remove_index :foods, column: [:users_id]
    remove_column :foods, :users_id
    add_reference :foods, :user, foreign_key: true
  end
end
