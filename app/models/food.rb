class Food < ApplicationRecord
<<<<<<< HEAD
  belongs_to :users, class_name: 'User'
  has_many :recipe_foods
=======
  belongs_to :user
  validates :name, :measurement, :price, :quantity, presence: true
>>>>>>> 38ac739680ed8efea405d95ad9337f723384fb31
end
