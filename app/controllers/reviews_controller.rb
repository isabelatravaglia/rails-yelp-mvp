class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save # true / false
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      # Will render /views/restaurants/new.html.erb
      # @restaurant.errors will not be empty!
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :restaurant_id)
  end
end
