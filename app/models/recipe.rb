class Recipe < ActiveRecord::Base
  belongs_to :user, class_name: 'User'
  has_many :recipe_foods, dependent: :destroy, class_name: 'RecipeFood'
  has_many :foods, through: :recipe_foods

  validates :name, presence: true
  validates :public, inclusion: { in: [true, false] }
end
