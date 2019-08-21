class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = @restaurant.reviews
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save # true / false
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      # Will render /views/restaurants/new.html.erb
      # @restaurant.errors will not be empty!
      render :new
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end

