class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end
  def create
    @review = Review.new(
      body:review_params["body"],
      rate: review_params["rate"],
      user_id: current_user.id,
      restaurant_id: params[:restaurant_id]
      )
      if @review.save then
        redirect_to restaurant_url(@review.restaurant)
      else
        render :new
      end
end

  def edit
   @restaurant = Restaurant.find(params[:restaurant_id])
   @review = Review.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to @restaurant
    else
      render :edit
    end
  end

private

def review_params
  params.require(:review).permit(:body, :rate)
end
end
