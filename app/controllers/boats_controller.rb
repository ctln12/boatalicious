class BoatsController < ApplicationController
  def index
    @boats = Boat.all
    @flats = Flat.geocoded #returns flats with coordinates

    @markers = @flats.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
  end

  def show
    @boat = Boat.find(params[:id])
  end
end
