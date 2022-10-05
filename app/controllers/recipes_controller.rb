class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(user_id: current_user.id).order('id ASC')
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    user = current_user
    @recipe = user.recipes.new(recipe_params)
    if @recipe.save
      redirect_to(recipes_path)
      flash[:success] = 'Recipe was successfully added.'
    else
      render('new')
      flash[:failed] = 'Recipe was not added - please fix the error(s)'
    end
  end

  def delete
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      redirect_to(recipes_path)
      flash[:success] = 'Recipe was successfully deleted.'
    else
      render('delete')
      flash[:failed] = 'Recipe could not be deleted'
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description)
  end
end
