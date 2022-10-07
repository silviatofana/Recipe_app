class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  # GET /recipes or /recipes.json
  def index
    @current_user = current_user
    if @current_user.nil?
      redirect_to user_session_path, flash: { alert: 'You must be signed in to continue.' }
    else
      @recipes = @current_user.recipes
    end
  end

  def shopping_list
    @recipes = User.find(params[:user_id]).recipes
    @foods = Food.all
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @recipe = Recipe.find_by_id(params[:id])
    @recipe_foods = @recipe&.recipe_foods
    @recipe = 'No recipes' if @recipe.nil?
    @current_user = current_user
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    @foods = Food.all
    @recipe.recipe_foods.build
  end

  # GET /recipes/1/edit
  def edit; end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(recipe_params.merge(user: current_user))

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe = Recipe.find_by_id(params[:id])
    return unless @recipe.user == current_user

    if @recipe.destroy
      respond_to do |format|
        format.html { redirect_to recipes_url, notice: 'Recipe was successfully deleted.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to recipes_url, notice: 'Recipe was not deleted.' }
        format.json { head :no_content }
      end
    end
  end

  def toogle_public
    @recipe = set_recipe
    @recipe.public = !@recipe.public
    text = 'private'
    text = 'public' if @recipe.public
    if @recipe.save
      flash[:success] = "#{@recipe.name} is now #{text}!"
    else
      flash[:fail] = @recipe.public
    end
    redirect_to recipe_path(@recipe.id)
  end

  def public_recipes
    @recipes = Recipe.where(public: true)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
