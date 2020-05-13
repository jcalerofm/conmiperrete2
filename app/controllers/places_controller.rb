class PlacesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :new, :update]
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  def index
    @places = Place.geocoded
    @markers = @places.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { place: place }),
        image_url: helpers.asset_url('https://res.cloudinary.com/dhkoueugk/image/upload/v1589016082/Perretes/pugpugjs_xzjmdi.svg'),
      }
    end
    if params[:places]
      @temp_place = Place.create(name:'temp', description: 'temp', address: params[:places])
      @center = [@temp_place.latitude.dup, @temp_place.longitude.dup]
      marker = {
        lat: @temp_place.latitude,
        lng: @temp_place.longitude,
        image_url: helpers.asset_url('https://image.flaticon.com/icons/png/512/149/149060.png'),
      }
      @markers << marker
      @temp_place.delete
    else
      @center = 0
    end
  end

  def show
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
  end

  def update
    @place.update(place_params)
    if @place.save
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  # def destroy
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
