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

