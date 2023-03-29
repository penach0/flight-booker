class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @num_passengers = params[:num_passengers].to_i
    @flight = Flight.find(params[:flight_id])

    @num_passengers.times { @booking.passengers.build }
  end

  def show
  end

  def create
  end
end
