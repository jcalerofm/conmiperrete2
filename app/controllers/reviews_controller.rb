class ReviewsController < ApplicationController
  # before_action :set_user
  def new
    @review = Review.new
  end


  def edit
  end

  def create
    @place = Place.find(params[:place_id])
    @review = Review.new(review_params)
    @review.place = @place
    if @review.save
      redirect_to place_path(@place, anchor: "review-#{@review.id}")
    else
      render 'places/show'
    end

  end

  private

  # def set_user
  #   @user = User.find(params[:user_id])
  # end

  def review_params
    params.require(:review).permit(:content)
  end

end
