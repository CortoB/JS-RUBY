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
  time_component = 0
  (1..rental_days).each do |day|
    if day <= 1
      time_component += price_per_day
    elsif day <= 4
      time_component += price_per_day * 0.9
    elsif day <= 10
      time_component += price_per_day * 0.7
    else
      time_component += price_per_day * 0.5
    end
  end
  distance_component = distance * price_per_km
  rental_price = time_component.to_i + distance_component
end

# Calcul et affichage du prix avec les nouvelles règles
input_data["rentals"].each do |rental|
  car = input_data["cars"].find { |c| c["id"] == rental["car_id"] }

  rental_days = calculate_rental_days(rental["start_date"], rental["end_date"])
  rental_price = calculate_rental_price(car["price_per_day"], car["price_per_km"], rental_days, rental["distance"])

  puts "Id: #{rental["id"]} - Prix: #{rental_price} euros"
end
