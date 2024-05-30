# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "open-uri"

# Clear existing data
Location.delete_all
Property.delete_all

# Seed locations in Austin, Texas
locations = Location.create!([
  { city: 'Austin', state: 'TX', neighborhood: 'Downtown' },
  { city: 'Austin', state: 'TX', neighborhood: 'South Congress' },
  { city: 'Austin', state: 'TX', neighborhood: 'East Austin' },
  { city: 'Austin', state: 'TX', neighborhood: 'Westlake' },
  { city: 'Austin', state: 'TX', neighborhood: 'Zilker' },
  { city: 'Austin', state: 'TX', neighborhood: 'Mueller' },
  { city: 'Austin', state: 'TX', neighborhood: 'Hyde Park' }
])

# Define property attributes
property_data = [{
    title: "Modern Downtown Condo",
    description: "Beautiful condo with city views",
    address: "123 Main St, Austin, TX",
    beds: 2,
    baths: 2,
    square_feet: 1200,
    acres: 0.10,
    price: 750000.00,
    home_type: 0,
    status: 0,
    location: locations[0]
  },
  {
    title: "Cozy South Congress Bungalow",
    description: "Charming bungalow in a trendy neighborhood",
    address: "456 Congress Ave, Austin, TX",
    beds: 3,
    baths: 1,
    square_feet: 900,
    acres: 0.15,
    price: 450000.00,
    home_type: 0,
    status: 0,
    location: locations[1]
  },
  {
    title: "Spacious East Austin Home",
    description: "Large home with a big backyard",
    address: "789 East St, Austin, TX",
    beds: 4,
    baths: 3,
    square_feet: 2000,
    acres: 0.25,
    price: 650000.00,
    home_type: 0,
    status: 0,
    location: locations[2]
  },
  {
    title: "Luxury Westlake Villa",
    description: "Exclusive villa with stunning views",
    address: "101 Westlake Dr, Austin, TX",
    beds: 5,
    baths: 4,
    square_feet: 3000,
    acres: 0.50,
    price: 1500000.00,
    home_type: 0,
    status: 0,
    location: locations[3]
  },
  {
    title: "Zilker Parkside Home",
    description: "Family home near Zilker Park",
    address: "202 Zilker St, Austin, TX",
    beds: 3,
    baths: 2,
    square_feet: 1500,
    acres: 0.20,
    price: 700000.00,
    home_type: 0,
    status: 0,
    location: locations[4]
  },
  {
    title: "Modern Mueller House",
    description: "Contemporary home in Mueller neighborhood",
    address: "303 Mueller Blvd, Austin, TX",
    beds: 4,
    baths: 3,
    square_feet: 2200,
    acres: 0.18,
    price: 800000.00,
    home_type: 0,
    status: 0,
    location: locations[5]
  },
  {
    title: "Historic Hyde Park Residence",
    description: "Charming historic home in Hyde Park",
    address: "404 Hyde Park Rd, Austin, TX",
    beds: 3,
    baths: 2,
    square_feet: 1400,
    acres: 0.22,
    price: 650000.00,
    home_type: 0,
    status: 0,
    location: locations[6]
  },
  {
    title: "Chic Downtown Loft",
    description: "Stylish loft with modern amenities",
    address: "125 Main St, Austin, TX",
    beds: 1,
    baths: 1,
    square_feet: 800,
    acres: 0.05,
    price: 500000.00,
    home_type: 0,
    status: 0,
    location: locations[0]
  },
  {
    title: "Modern South Congress Apartment",
    description: "Cozy apartment in a vibrant area",
    address: "457 Congress Ave, Austin, TX",
    beds: 2,
    baths: 2,
    square_feet: 1100,
    acres: 0.10,
    price: 600000.00,
    home_type: 0,
    status: 0,
    location: locations[1]
  },
  {
    title: "New East Austin Condo",
    description: "Contemporary condo in trendy East Austin",
    address: "790 East St, Austin, TX",
    beds: 2,
    baths: 2,
    square_feet: 1300,
    acres: 0.12,
    price: 700000.00,
    home_type: 0,
    status: 0,
    location: locations[2]
  },
  {
    title: "Grand Westlake Estate",
    description: "Luxury estate with expansive grounds",
    address: "102 Westlake Dr, Austin, TX",
    beds: 6,
    baths: 5,
    square_feet: 4500,
    acres: 1.00,
    price: 2500000.00,
    home_type: 0,
    status: 0,
    location: locations[3]
  },
  {
    title: "Sunny Zilker Cottage",
    description: "Cozy cottage near Zilker Park",
    address: "203 Zilker St, Austin, TX",
    beds: 2,
    baths: 1,
    square_feet: 1000,
    acres: 0.15,
    price: 550000.00,
    home_type: 0,
    status: 0,
    location: locations[4]
  },
  {
    title: "Mueller Modern Townhouse",
    description: "Stylish townhouse in Mueller",
    address: "304 Mueller Blvd, Austin, TX",
    beds: 3,
    baths: 2,
    square_feet: 1600,
    acres: 0.10,
    price: 750000.00,
    home_type: 0,
    status: 0,
    location: locations[5]
  },
  {
    title: "Charming Hyde Park Bungalow",
    description: "Lovely bungalow in historic Hyde Park",
    address: "405 Hyde Park Rd, Austin, TX",
    beds: 2,
    baths: 1,
    square_feet: 1200,
    acres: 0.18,
    price: 600000.00,
    home_type: 0,
    status: 0,
    location: locations[6]
  },
  {
    title: "Spacious Downtown Apartment",
    description: "Large apartment with city views",
    address: "126 Main St, Austin, TX",
    beds: 3,
    baths: 2,
    square_feet: 1400,
    acres: 0.10,
    price: 800000.00,
    home_type: 0,
    status: 0,
    location: locations[0]
  },
  {
    title: "Trendy South Congress Studio",
    description: "Studio apartment in a trendy area",
    address: "458 Congress Ave, Austin, TX",
    beds: 1,
    baths: 1,
    square_feet: 700,
    acres: 0.05,
    price: 400000.00,
    home_type: 0,
    status: 0,
    location: locations[1]
  },
  {
    title: "Modern East Austin Duplex",
    description: "Contemporary duplex in East Austin",
    address: "791 East St, Austin, TX",
    beds: 3,
    baths: 3,
    square_feet: 2100,
    acres: 0.20,
    price: 900000.00,
    home_type: 0,
    status: 0,
    location: locations[2]
  },
  {
    title: "Exclusive Westlake Mansion",
    description: "Magnificent mansion with breathtaking views",
    address: "103 Westlake Dr, Austin, TX",
    beds: 7,
    baths: 6,
    square_feet: 5000,
    acres: 1.50,
    price: 3000000.00,
    home_type: 0,
    status: 0,
    location: locations[3]
  },
  {
    title: "Family Home Near Zilker",
    description: "Perfect family home near Zilker Park",
    address: "204 Zilker St, Austin, TX",
    beds: 4,
    baths: 3,
    square_feet: 1800,
    acres: 0.25,
    price: 850000.00,
    home_type: 0,
    status: 0,
    location: locations[4]
  },
  {
    title: "Contemporary Mueller Apartment",
    description: "Modern apartment in Mueller",
    address: "305 Mueller Blvd, Austin, TX",
    beds: 2,
    baths: 2,
    square_feet: 1400,
    acres: 0.08,
    price: 650000.00,
    home_type: 0,
    status: 0,
    location: locations[5]
  },
  {
    title: "Hyde Park Family Home",
    description: "Spacious home in a great neighborhood",
    address: "406 Hyde Park Rd, Austin, TX",
    beds: 4,
    baths: 3,
    square_feet: 2000,
    acres: 0.30,
    price: 850000.00,
    home_type: 0,
    status: 0,
    location: locations[6]
  },
  {
    title: "Central Austin Condo",
    description: "Convenient condo in the heart of the city",
    address: "127 Main St, Austin, TX",
    beds: 2,
    baths: 2,
    square_feet: 1100,
    acres: 0.10,
    price: 600000.00,
    home_type: 0,
    status: 0,
    location: locations[0]
  },
  {
    title: "South Congress Penthouse",
    description: "Luxury penthouse with amazing views",
    address: "459 Congress Ave, Austin, TX",
    beds: 4,
    baths: 4,
    square_feet: 3000,
    acres: 0.20,
    price: 2000000.00,
    home_type: 0,
    status: 0,
    location: locations[1]
  },
  {
    title: "East Austin Urban House",
    description: "Modern urban house in East Austin",
    address: "792 East St, Austin, TX",
    beds: 3,
    baths: 2,
    square_feet: 1500,
    acres: 0.20,
    price: 700000.00,
    home_type: 0,
    status: 0,
    location: locations[2]
  },
  {
    title: "Westlake Luxury Home",
    description: "High-end home in the Westlake area",
    address: "104 Westlake Dr, Austin, TX",
    beds: 5,
    baths: 4,
    square_feet: 3500,
    acres: 0.70,
    price: 1800000.00,
    home_type: 0,
    status: 0,
    location: locations[3]
  },
]

# Seed properties
property_data.each_with_index do |property_attrs, index|
  property = Property.create!(property_attrs)
  (1..5).each do |image_index|
    image_filename = "property_#{index + 1}_#{image_index}.jpg"
    image_path = Rails.root.join("db/seeds/images/#{image_index}/#{image_filename}")
    property.images.attach(io: File.open(image_path), filename: image_filename)
  end
end

puts "✅ Seeded properties with images"
