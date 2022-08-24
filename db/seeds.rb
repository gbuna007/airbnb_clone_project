# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

sarina = User.create(email: "sarina.y.ke@gmail.com", password: "sarina123", first_name: "Sarina", last_name: "Ke")
laura = User.create(email: "laura.kim@gmail.com", password: "laura123", first_name: "Laura", last_name: "Williams")
anushka = User.create(email: "anushka.p@gmail.com", password: "anushka123", first_name: "Anushka", last_name: "Vodivya")

mansion = Flat.new(name: "Mansion", location: "Beverly Hills", price: 10000, occupants: 10)
mansion.user = sarina
mansion.save

house = Flat.new(name: "House", location: "NYC", price: 7000, occupants: 2)
house.user = laura
house.save

apartment = Flat.new(name: "Apartment", location: "SG", price: 1000, occupants: 3)
apartment.user = anushka
apartment.save
