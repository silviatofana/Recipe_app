class PublicRecipesController < ApplicationController
  def index
    @public_recipe = Recipe.new
    @public_recipes = Recipe.where(public: true).order(created_at: :desc)
  end
end
