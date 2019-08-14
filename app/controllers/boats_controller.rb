class BoatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

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
    @booking = Booking.new
    @booking.boat = Boat.find(params[:id])
    price = @booking.boat.price_per_day
    @tourism = (price * 0.02).round(2)
    @cleaning = (price * 0.05).round(2)
    @booking.price = (price + @tourism + @cleaning).round(2)
  end
end
