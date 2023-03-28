class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { |a| [a.codename, a.id] }
    @date_options = Flight.all.map { |f| [f.formatted_date, f.date] }

    @available_flights = Flight.search(departure: params[:departure_airport_id],
                                        arrival: params[:arrival_airport_id],
                                        date_picked: params[:date].to_date)
  end
end
