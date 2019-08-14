class BoatsController < ApplicationController
  def index
    @boats = Boat.all
    @boats_geo = Boat.geocoded #returns flats with coordinates

    @markers = @boats_geo.map do |boat|
      {
        lat: boat.latitude,
        lng: boat.longitude
      }
    end
  end

  def show
    @boat = Boat.find(params[:id])
  end
end
