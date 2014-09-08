class ReviewsController < ApplicationController
  before_filter :authorize, only: [:edit, :update]

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = @restaurant.reviews
  end

  def new
    restaurant = Restaurant.find(params[:restaurant_id])
    @review = restaurant.reviews.new
  end

  def create
    restaurant = Restaurant.find(params[:restaurant_id])
    @review = restaurant.reviews.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to restaurant_path(restaurant)
    else
      render 'new'
    end
  end

  def show
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = @restaurant.reviews
    @review = @reviews.find(params[:id])
  end

private
  def review_params
    params.require(:review).permit(:review_details, :rating, :user_id, :restaurant_id)
  end
end
