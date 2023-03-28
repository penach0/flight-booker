class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { |a| [a.codename, a.id] }
    @date_options = Flight.all
                          .order(:date)
                          .map { |f| [f.formatted_date, f.date] }
                          .uniq(&:first)
    @available_flights = []
    @num_passengers = params[:num_passengers]

    if params[:commit].present?
      @available_flights = Flight.available_flights(departure: params[:departure_airport_id],
                                                    arrival: params[:arrival_airport_id],
                                                    date_picked: params[:date].to_date)
    end
  end
end
