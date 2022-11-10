class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @user = current_user

    # spaces variable

    @events = @user.events

    # bookings variables
    # @bookings = @user.bookings
    # @current_bookings = @user.bookings.select { |booking| booking.status == "confirmed" }
    # @future_bookings = @user.bookings.select { |booking| booking.status == "pending" }
    # @past_bookings = @user.bookings.select { |booking| booking.status == "rejected" }
  end
end
