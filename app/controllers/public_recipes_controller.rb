class PublicRecipesController < ApplicationController
  def index
    # @public_recipes = Recipe.where(public: true).order(created_at: :desc)
    @public_recipes = Recipe.all
  end
end
