class BoatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def new
    @boat = Boat.new
    @boat.user = User.find(53)
  end

  def index
    @boats = Boat.all
    @boats_geo = Boat.geocoded #returns boats with coordinates

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

    @boat_geo = Boat.geocoded.find(params[:id]) #returns boat with coordinates

    @marker = [{ lat: @boat_geo.latitude, lng: @boat_geo.longitude }]
  end
end
