require 'csv'
require 'pry'

destinations = Array.new
shipped = Array.new
crates = Array.new
profit = Array.new
trips = Array.new
money = 0
earth_money = 0
mars_money = 0
uranus_money = 0

CSV.foreach("shipments.csv", headers: true) do |row|
  destinations.push row['Destination']
  shipped.push row['What got shipped']
  crates.push row['Number of crates'].to_i
  profit.push row['Profit per crate'].to_i
  if row['Destination'] == 'Earth'
    earth_money += row['Number of crates'].to_i * row['Profit per crate'].to_i
    end
  if row['Destination'] == 'Mars'
    mars_money += row['Number of crates'].to_i * row['Profit per crate'].to_i
    end
  if row['Destination'] == 'Uranus'
    uranus_money += row['Number of crates'].to_i * row['Profit per crate'].to_i
    end
  end

trips = destinations.zip(shipped,crates,profit)

money_per_ship = profit.zip(crates).map do |x, y| x*y end
  money_per_ship.each do |i|
    money += i
    end



total_trips = destinations.count
fry_trips = destinations.count "Earth"
amy_trips = destinations.count "Mars"
bender_trips = destinations.count "Uranus"
leela_trips = total_trips - fry_trips - amy_trips - bender_trips

puts "Total weekly profits were #{money}. There were #{total_trips} total trips.
      Fry took #{fry_trips} trips to Earth, Amy took #{amy_trips} trips to Mars,
      Bender took #{bender_trips} trips to Uranus, and Leela took #{leela_trips}
      trips everywhere else. Fry's bonus was #{earth_money/10}, Amy's bonus
      was #{mars_money/10}, Bender's bonus was #{uranus_money/10}, and Leela's
      bonus was #{(money - earth_money - mars_money - uranus_money)/10}."


# class Shipments
#   attr_reader :destination :shipped :crates :profit
#
#   def initialize
#   end
#
# end
#
#
# earth = Shipments.new
# fry_total =

class Pilot
