class BookingsController < ApplicationController
  def new
    @num_passengers = params[:num_passengers]
    @flight = Flight.find(params[:flight_id])
  end

  def show
  end

  def create
  end
end
