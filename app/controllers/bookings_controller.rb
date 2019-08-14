class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @booking.boat = Boat.find(params[:boat_id])
    price = @booking.boat.price_per_day
    @tourism = (price * 0.02).round(2)
    @cleaning = (price * 0.05).round(2)
    @booking.price = (price + @tourism + @cleaning).round(2)
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.price = price_per_day(@booking)
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end



  end

  def index
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :boat_id)
  end

  def price_per_day(booking)
    price = booking.boat.price_per_day
    tourism = (price * 0.02).round(2)
    cleaning = (price * 0.05).round(2)
    (price + tourism + cleaning).round(2)
  end
end

# calculate the price based on the boat
