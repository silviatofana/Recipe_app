class RecipeFoodsController < ApplicationController
  def new
    @user = current_user
    @recipe = Recipe.find_by_id(params[:recipe_id])
    @foods = @user.foods
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe = Recipe.find_by_id(params[:recipe_id])
    @recipe_food = RecipeFood.new(recipe_food_params.merge(recipe_id: @recipe.id))
    if @recipe_food.valid?
      @recipe_food.save
      redirect_to recipe_path(@recipe.id)
    else
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find_by_id(params[:recipe_id])
    @recipe_food = RecipeFood.find_by_id(params[:id])
    @recipe_food.destroy
    respond_to do |format|
      format.html { redirect_to recipe_path(@recipe.id), notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
