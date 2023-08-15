require 'json'
require 'date'

input_data = JSON.parse(File.read('data/input.json'))

# Calcule la durée de location
def calculate_rental_days(start_date, end_date)
  rental_start = Date.parse(start_date)
  rental_end = Date.parse(end_date)
  rental_days = (rental_end - rental_start).to_i + 1
end

# Calcule le prix de location
def calculate_rental_price(price_per_day, price_per_km, rental_days, distance)
  time_component = rental_days * price_per_day
  distance_component = distance * price_per_km
  rental_price = time_component + distance_component
end

# Calcul et affichage du prix
input_data["rentals"].each do |rental|
  car = input_data["cars"].find { |c| c["id"] == rental["car_id"] }

  rental_days = calculate_rental_days(rental["start_date"], rental["end_date"])
  rental_price = calculate_rental_price(car["price_per_day"], car["price_per_km"], rental_days, rental["distance"])

  puts "Id: #{rental["id"]} - Prix: #{rental_price} euros"
end

