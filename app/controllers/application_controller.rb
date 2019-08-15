class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    # redirect to the form if there is a form_data in the session
    if session[:form_data].present?
      # redirect to your form path
      @booking = current_user.bookings.create(session[:form_data]["booking"])
      # session[:form_data] = nil
      flash[:notice] = "Sweet, logged in. Good choice btw!"
      bookings_path(@booking.user, @booking)
    else
      # if there is not temp list in the session proceed as normal
      super
    end
  end
end
