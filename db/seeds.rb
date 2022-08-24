# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# user with no attachment into any bookings or flats
sarina = User.create(email: "sarina.y.ke@gmail.com", password: "sarina123", first_name: "Sarina", last_name: "Ke")

# user that makes bookings - renter
laura = User.create(email: "laura.kim@gmail.com", password: "laura123", first_name: "Laura", last_name: "Williams")

# users that creates flats - landlord
anushka = User.create(email: "anushka.p@gmail.com", password: "anushka123", first_name: "Anushka", last_name: "Vodivya")

# flats
mansion = Flat.new(name: "Mansion", location: "Beverly Hills", price: 10000, occupants: 10, photo_url: 'app/assets/images/placeholder.jpeg')
mansion.user = anushka
mansion.save!

house = Flat.new(name: "House", location: "NYC", price: 7000, occupants: 2, photo_url: 'app/assets/images/placeholder.jpeg')
house.user = anushka
house.save!

apartment = Flat.new(name: "Apartment", location: "SG", price: 1000, occupants: 3, photo_url: 'app/assets/images/placeholder.jpeg')
apartment.user = anushka
apartment.save!

house1 = Flat.new(name: "Countryside house just outside the city", location: "Dublin", price: 3000, occupants: 5)
house1.user = laura
house1.save!

house2 = Flat.new(name: "Rural seaside hut", location: "Bali", price: 7000, occupants: 6)
house2.user = laura
house2.save!

apartment = Flat.new(name: "Small 3-room Apartment", location: "SG", price: 2500, occupants: 3)
apartment.user = anushka
apartment.save!

apartment1 = Flat.new(name: "65sq medium room", location: "Budapest", price: 1200, occupants: 2)
apartment1.user = anushka
apartment1.save!

# completed bookings with no reviews yet
book2 = Booking.new(accepted: true, payment_received: true, start_date: (Date.today - 10), end_date: (Date.today - 7))
book2.user = laura
book2.flat = house
book2.save!

# completed bookings with review
book3 = Booking.new(accepted: true, payment_received: true, start_date: (Date.today - 15), end_date: (Date.today - 10))
book3.user = laura
book3.flat = mansion
book3.save!

review1 = Review.new(comment: "This is the best FakeBnB ever!", rating: 4.5)
review1.booking = book3
review1.save!

# bookings with pending accept, payment received, landlord will need to accept the booking in order for the booking to be fully confirmed
book1 = Booking.new(accepted: false, payment_received: true, start_date: Date.today, end_date: (Date.today + 4))
book1.user = laura
book1.flat = mansion
book1.save!
