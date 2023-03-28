# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Flight.delete_all
Airport.delete_all

AIRPORT_CODES = ["LAX", "JFK", "CDG", "DXB", "SIN", "HKG", "LHR", "PVG", "ICN", "SYD"]

AIRPORT_CODES.each { |code| Airport.create({ codename: code }) }

10.times do |_i|
  departure_airport_id = Airport.ids.sample
  arrival_airport_id = (Airport.ids - [departure_airport_id]).sample

  Flight.create!(departure_airport_id:,
                 arrival_airport_id:,
                 start: rand(Time.current..1.year.from_now),
                 duration: 1.hour)
end
