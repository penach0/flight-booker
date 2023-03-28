class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { |a| [a.codename, a.id] }
    @date_options = Flight.all.map { |f| [f.date, f.id] }
  end
end
