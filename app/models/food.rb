class Food < ApplicationRecord
  belongs_to :users, class_name: 'User'
  has_many :recipe_foods
end
