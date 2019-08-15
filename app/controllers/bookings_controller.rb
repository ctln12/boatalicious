class BookingsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :create]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
    @booking.boat = Boat.find(params[:boat])
    price = @booking.boat.price_per_day
    @tourism = (price * 0.02).round(2)
    @cleaning = (price * 0.05).round(2)
    @booking.price = (price + @tourism + @cleaning).round(2)
  end

  def create
    # Check to see if the user is registered/logged in
    if current_user.nil?
      # Store the form data in the session so we can retrieve it after login
      session[:form_data] = params
      # Redirect the user to register/login
      redirect_to new_user_session_path
    else
      @booking = Booking.new(booking_params)
      @booking.price = price_per_day(@booking)
      @booking.user = current_user
      if @booking.save
        redirect_to(bookings_path(@booking.user, @booking), :notice => 'Sweet, your booking has been created.')
      else
        render :new
      end
    end
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
