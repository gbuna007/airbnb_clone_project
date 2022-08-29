require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# USERS
# visitor
sarina = User.create(email: "sarina@gmail.com", password: "sarina123", first_name: "Sarina", last_name: "Ke")

# renter
laura = User.create(email: "laura@gmail.com", password: "laura123", first_name: "Laura", last_name: "Williams")

# landlord
anushka = User.create(email: "anushka@gmail.com", password: "anushka123", first_name: "Anushka", last_name: "Vodivya")

# AMENITIES
wifi = Amenity.create(name: "Wifi")
tv = Amenity.create(name: "TV")
ac = Amenity.create(name: "Air Conditioning")
workspace = Amenity.create(name: "Workspace")
kitchen = Amenity.create(name: "Kitchen")
balcony = Amenity.create(name: "Private Balcony")
public_pool = Amenity.create(name: "Public Pool")
private_pool = Amenity.create(name: "Private Pool")
paid_parking = Amenity.create(name: "Paid Parking")
free_parking = Amenity.create(name: "Free Parking")
garden = Amenity.create(name: "Garden")
pets = Amenity.create(name: "Pets Allowed")
smoke_alarm = Amenity.create(name: "Smoke Alarm")

# FLATS
file = URI.open("https://images.unsplash.com/photo-1589768818821-cd6368407a10?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80")
flat1 = Flat.new(
  name: "Aura House 2bds Eco Bamboo House, Pool, River View",
  description: "Aura house is a beautiful & unique eco bamboo house built on the west bank of the River Ayung facing east to catch sunrise. Aura House is situated 25min away from Ubud, and 35min away from Canggu.",
  location: "Abiansemal, Bali, Indonesia",
  price: 502,
  num_occupants: 4,
  num_bedroom: 2,
  num_bathroom: 2,
  lng: 103.8198,
  lat: 1.3521)
flat1.photos.attach(io: file, filename: "bamboo.png", content_type: "image/png")
flat1.user = anushka
flat1.save!

flat_amenities = FlatAmenity.create(flat: flat1, amenity: wifi)
flat_amenities = FlatAmenity.create(flat: flat1, amenity: tv)


file2 = URI.open("https://images.unsplash.com/photo-1580565996832-60ccfdf1a755?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1761&q=80")
flat2 = Flat.new(
  name: "Turtle Bay HuaHin eco luxeTurt Villa in Lotus Bay",
  description: "A unique Turtle Shape villa located in natural lotus pond surrounding by nature Khao Tao Valley and Sai Noi beach. Private one bed room studio villa comprising spacious bathroom and outdoor waterside living deck.",
  location: "Tambon Nong Kae, Chang Wat Prachuap Khiri Khan, Thailand",
  price: 135,
  num_occupants: 2,
  num_bedroom: 1,
  num_bathroom: 1,
  lng: 101.8198,
  lat: 1.3221)
flat2.photos.attach(io: file2, filename: "eco.png", content_type: "image/png")
flat2.user = anushka
flat2.save!

flat_amenities = FlatAmenity.create(flat: flat2, amenity: ac)
flat_amenities = FlatAmenity.create(flat: flat2, amenity: workspace)

file3 = URI.open("https://images.unsplash.com/photo-1602448727879-f33999d1e72b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2778&q=80")
flat3 = Flat.new(
  name: "Nacpan Beach Glamping, Ocean View Room",
  description: "Nacpan Glamping is located on one of the top rated beaches in Asia, ‘Nacpan Beach’, El Nido, Palawan. Stretching 4.2km, this white sand beach is fast becoming a World renowned must see destination in the Philippines.",
  location: "El Nido, Philippines",
  price: 225,
  num_occupants: 2,
  num_bedroom: 1,
  num_bathroom: 1,
  lng: 103.8198,
  lat: 1.286560)
flat3.photos.attach(io: file3, filename: "glamping.png", content_type: "image/png")
flat3.user = anushka
flat3.save!

flat_amenities = FlatAmenity.create(flat: flat3, amenity: kitchen)
flat_amenities = FlatAmenity.create(flat: flat3, amenity: balcony)

file4 = URI.open("https://images.unsplash.com/photo-1558005530-a7958896ec60?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1771&q=80")
flat4 = Flat.new(
  name: "HIDEOUT HORIZON - Eco Bamboo Home",
  description: "Hideout Horizon is the largest addition to the Hideout Family. The most adventurous all-bamboo home is ready to welcome those seeking a little jungle adventure in East Karangasem. Your perfect little staycation in Bali is right here. We take relaxation seriously.",
  location: "Selat, Bali, Indonesia",
  price: 329,
  num_occupants: 4,
  num_bedroom: 2,
  num_bathroom: 2,
  lng: 103.8198,
  lat: 1.286560)
flat4.photos.attach(io: file4, filename: "bali.png", content_type: "image/png")
flat4.user = anushka
flat4.save!

flat_amenities = FlatAmenity.create(flat: flat3, amenity: kitchen)
flat_amenities = FlatAmenity.create(flat: flat3, amenity: balcony)

file5 = URI.open("https://images.unsplash.com/photo-1612645213559-6af1d4edeaf8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80")
flat5 = Flat.new(
  name: "Makalele Eclipse Family Suite",
  description: "Floating above an ocean of green palms, Makalele Dome Villas has one of the most spectacular settings in the world. Perched atop a verdant bukit peninsula cliff overlooking a sea of azure blues with volcano views.",
  location: "Pemenang, West Nusa Tenggara, Indonesia",
  price: 165,
  num_occupants: 4,
  num_bedroom: 1,
  num_bathroom: 2,
  lng: 103.8198,
  lat: 1.286560)
flat5.photos.attach(io: file5, filename: "suite.png", content_type: "image/png")
flat5.user = anushka
flat5.save!

flat_amenities = FlatAmenity.create(flat: flat3, amenity: kitchen)
flat_amenities = FlatAmenity.create(flat: flat3, amenity: balcony)

file6 = URI.open("https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1560&q=80")
house1 = Flat.new(
  name: "Countryside apartment just outside the city",
  description: "Perfect for one; cosy for two. Styled on our larger Locke Studios, our 26m² no-nonsense City Studios have everything you need for a short stay in Dublin.",
  location: "Dublin",
  price: 3000,
  num_occupants: 5,
  num_bedroom: 1,
  num_bathroom: 1,
  lng: 103.8198,
  lat: 1.314651)
house1.photos.attach(io: file6, filename: "house.png", content_type: "image/png")
house1.user = laura
house1.save!

flat_amenities = FlatAmenity.create(flat: house1, amenity: public_pool)
flat_amenities = FlatAmenity.create(flat: house1, amenity: paid_parking)

file7 = URI.open("https://images.unsplash.com/photo-1474874055390-459bc92357f3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1962&q=80")
house2 = Flat.new(
  name: "Rural seaside hut",
  description: "Hideout Horizon is the largest addition to the Hideout Family. The most adventurous all-bamboo home is ready to welcome those seeking a little jungle adventure in East Karangasem. Your perfect little staycation in Bali is right here. We take relaxation seriously.",
  location: "Bali",
  price: 7000,
  num_occupants: 6,
  num_bedroom: 1,
  num_bathroom: 1,
  lng: 103.9198,
  lat: 1.314650)
house2.photos.attach(io: file7, filename: "hut.png", content_type: "image/png")
house2.user = laura
house2.save!

flat_amenities = FlatAmenity.create(flat: house2, amenity: private_pool)
flat_amenities = FlatAmenity.create(flat: house2, amenity: free_parking)

# LAURA'S BOOKINGS
# booking with no reviews
book1 = Booking.new(accepted: true, payment_received: true, start_date: (Date.today - 10), end_date: (Date.today - 7), num_guests: 2)
book1.user = laura
book1.flat = flat1
book1.save!

# booking with a review
book2 = Booking.new(accepted: true, payment_received: true, start_date: (Date.today - 15), end_date: (Date.today - 10), num_guests: 2)
book2.user = laura
book2.flat = flat2
book2.save!

review = Review.new(comment: "This is the best FakeBnB ever!", rating: 4.5)
review.booking = book2
review.save!

# booking with payment received, pending acceptance
book3 = Booking.new(accepted: false, payment_received: true, start_date: Date.today, end_date: (Date.today + 4), num_guests: 2)
book3.user = laura
book3.flat = flat3
book3.save!
