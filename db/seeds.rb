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

mansion = Flat.new(name: "California Mansion", location: "Beverly Hills", price: 10000, occupants: 10)
mansion.user = sarina
mansion.save

mansion1 = Flat.new(name: "Luxurious apartment", location: "NYC", price: 100000, occupants: 6)
mansion1.user = sarina
mansion1.save

mansion2 = Flat.new(name: "Landed property with a jamming studio", location: "SG", price: 50000, occupants: 8)
mansion2.user
mansion2.save

house = Flat.new(name: "House at the heart of the city", location: "NYC", price: 7000, occupants: 2)
house.user = laura
house.save

house1 = Flat.new(name: "Countryside house just outside the city", location: "Dublin", price: 3000, occupants: 5)
house1.user = laura
house1.save

house2 = Flat.new(name: "Rural seaside hut", location: "Bali", price: 7000, occupants: 6)
house2.user = laura
house2.save

apartment = Flat.new(name: "Small 3-room Apartment", location: "SG", price: 2500, occupants: 3)
apartment.user = anushka
apartment.save

apartment1 = Flat.new(name: "65sq medium room", location: "Budapest", price: 1200, occupants: 2)
apartment1.user = anushka
apartment1.save

apartment2 = Flat.new(name: "Small Room with a nearby gym", location: "Seoul", price: 1000, occupants: 1)
apartment2.user = anushka
apartment2.save
