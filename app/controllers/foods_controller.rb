class FoodsController < ApplicationController
  before_action :set_food, only: %i[show edit update destroy]

  # GET /foods or /foods.json
  def index
    @user = current_user
    @food = current_user.foods
  end

  # GET /foods/1 or /foods/1.json
  def show; end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit; end

  # POST /foods or /foods.json
  def create
    @user = current_user
    @food = Food.new(food_params)
    @food.user = @user

    respond_to do |format|
      if @food.save
        format.html { redirect_to foods_path, notice: 'Food was successfully created.' }
        format.json { render :index, status: :created, location: @food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1 or /foods/1.json
  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to food_url(@food), notice: 'Food was successfully updated.' }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    @food.destroy

    respond_to do |format|
      format.html { redirect_to foods_path, notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # def destroy
  #   @food = Food.find(params[:id])
  #   if @food.destroy
  #     flash.now[:success] = 'Food deleted successfully.'
  #   else
  #     flash.now[:error] = 'Food could not be deleted.'
  #   end
  #   redirect_to foods_path
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_food
    @food = Food.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def food_params
    params.require(:food).permit(:users_id, :name, :measurement, :price, :quantity)
  end
end
