# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# visitor
sarina = User.create(email: "sarina@gmail.com", password: "sarina123", first_name: "Sarina", last_name: "Ke")

# renter
laura = User.create(email: "laura@gmail.com", password: "laura123", first_name: "Laura", last_name: "Williams")

# landlord
anushka = User.create(email: "anushka@gmail.com", password: "anushka123", first_name: "Anushka", last_name: "Vodivya")

# flats
mansion = Flat.new(name: "Mansion", location: "Beverly Hills", price: 10000, num_occupants: 10)
mansion.user = anushka
mansion.save!

house = Flat.new(name: "House", location: "NYC", price: 7000, num_occupants: 2)
house.user = anushka
house.save!

apartment = Flat.new(name: "Apartment", location: "SG", price: 1000, num_occupants: 3)
apartment.user = anushka
apartment.save!

apartment = Flat.new(name: "Small 3-room Apartment", location: "SG", price: 2500, num_occupants: 3)
apartment.user = anushka
apartment.save!

apartment1 = Flat.new(name: "65sq medium room", location: "Budapest", price: 1200, num_occupants: 2)
apartment1.user = anushka
apartment1.save!

house1 = Flat.new(name: "Countryside house just outside the city", location: "Dublin", price: 3000, num_occupants: 5)
house1.user = laura
house1.save!

house2 = Flat.new(name: "Rural seaside hut", location: "Bali", price: 7000, num_occupants: 6)
house2.user = laura
house2.save!

# booking with no reviews
book1 = Booking.new(accepted: true, payment_received: true, start_date: (Date.today - 10), end_date: (Date.today - 7))
book1.user = laura
book1.flat = house
book1.save!

# booking with a review
book2 = Booking.new(accepted: true, payment_received: true, start_date: (Date.today - 15), end_date: (Date.today - 10))
book2.user = laura
book2.flat = mansion
book2.save!

review = Review.new(comment: "This is the best FakeBnB ever!", rating: 4.5)
review.booking = book2
review.save!

# booking with payment received, pending acceptance
book3 = Booking.new(accepted: false, payment_received: true, start_date: Date.today, end_date: (Date.today + 4))
book3.user = laura
book3.flat = mansion
book3.save!

# booking with payment received, accepted
