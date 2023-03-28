class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  def self.search(departure:, arrival:, date_picked:)
    where(departure_airport_id: departure,
          arrival_airport_id: arrival,
          date: (date_picked.midnight..date_picked.midnight + 1.day))
  end

  def formatted_date
    date.strftime("%m/%d/%Y")
  end
end
