class ReviewsController < ApplicationController
  before_action :set_user
  def new
    @review = Review.new
  end


  def edit
  end

  def create
    @review = Review.new(review.params)
    if @review.save
      redirect_to user_path(@user)
    else
      render :new
    end

  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end

end
