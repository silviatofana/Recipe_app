class PublicRecipesController < ApplicationController
  def index
<<<<<<< HEAD
    # @public_recipes = Recipe.where(public: true).order(created_at: :desc)
    @public_recipes = Recipe.all
=======
    @public_recipe = Recipe.new
    @public_recipes = Recipe.where(public: true).order(created_at: :desc)
>>>>>>> 3a3ce0d5a52d4d7a1b40739f8c5acf70ab434aaf
  end
end
