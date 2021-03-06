class PlacesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :new, :update]
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  def index
    p params[:places]
    @places = Place.geocoded
    @markers = @places.map do |place|
      if place.category == Place::CATEGORIES[0]
      {
        lat: place.latitude,
        lng: place.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { place: place }),
        image_url: helpers.asset_url('https://cdn0.iconfinder.com/data/icons/kameleon-free-pack-rounded/110/Beach-512.png'),
      }
      else
      {
        lat: place.latitude,
        lng: place.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { place: place }),
        image_url: helpers.asset_url('https://cdn0.iconfinder.com/data/icons/citycons/150/Citycons_park-512.png'),
      }
      end
    end
    

    if params[:places] == '' || params[:places] == nil
      @temp_place = Place.create(name:'Madrid', description: 'temp', address: 'Madrid')
      @center = [ @temp_place.latitude.dup, @temp_place.longitude.dup,]
      marker = {
        lat: @temp_place.latitude,
        lng: @temp_place.longitude,
        image_url: helpers.asset_url('compass.png'),
        infoWindow: render_to_string(partial: "info_window", locals: { place: @temp_place }),
      }
      @markers << marker
      @temp_place.delete
    
    else
      name = params[:places].split(',')
      p name
      @temp_place = Place.create(name:name[0], description: 'temp', address: params[:places])
      p params[:places]
      @center = [@temp_place.latitude.dup, @temp_place.longitude.dup]
      marker = {
        lat: @temp_place.latitude,
        lng: @temp_place.longitude,
        image_url: helpers.asset_url('compass.png'),
        infoWindow: render_to_string(partial: "info_window", locals: { place: @temp_place }),
      }
      @markers << marker
      @temp_place.delete
    end
  end

  def show
    set_place
    @review = Review.new
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
    params.require(:place).permit(:name, :category, :description, :photo, :latitude, :longitude)
  end
end
