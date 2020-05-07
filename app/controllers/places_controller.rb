class PlacesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_place, only: [:show, :edit, :update]

  def index
    @places = @places.all
  end

  def show
    @place = place.find(params[:id])
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.user = current_user
    if @place.save
      redirect_to places_path
    else
      render :new
    end
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = place.find(params[:id])
    if @place.update(place_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  # def destroy
  #   set_place
  #   @place.destroy
  #   redirect_to dashboard_path
  # end


  private

  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:name, :description, :photo)
  end
end
