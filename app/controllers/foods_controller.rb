class FoodsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @foods = @user.foods
  end

  def new
    @food = Food.new
  end

  def create
    @user = current_user
    @food = @user.foods.new(food_params)

    if @food.save
      redirect_to foods_path, notice: t('.success')
    else
      redirect_to new_food_path, alert: t('.failure')
      puts @food.errors.full_messages
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path, notice: t('.success')
  rescue ActiveRecord::RecordNotFound
    redirect_to foods_path, alert: t('.failure')
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
