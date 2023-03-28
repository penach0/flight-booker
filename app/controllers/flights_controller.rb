class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { |a| [a.codename, a.id] }
  end
end
