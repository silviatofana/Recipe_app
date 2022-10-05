class FoodsController < ApplicationController
  def index
    @food = Food.all
  end

  def show
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to foods_path
    else
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id]).destroy
    # User.find.posts_counter -= 1
    redirect_to foods_path
  end



  private

  def food_params
    params.require(:food).permit(:name, :measurement, :price, :quantity)
  end
end

