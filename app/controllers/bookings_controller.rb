class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
    @flight = Flight.find(@booking.flight_id)
  end

  def new
    @booking = Booking.new
    @num_passengers = params[:num_passengers].to_i
    @flight = Flight.find(params[:flight_id])

    @num_passengers.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to @booking
      flash[:success] = "Your booking has been registered, have a nice trip!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def booking_params
      params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email])
    end
end
