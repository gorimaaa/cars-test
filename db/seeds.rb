# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



# Supprimer toutes les données existantes pour éviter les doublons
Reservation.destroy_all
User.destroy_all

User.create!(
  email: "admin@roadstr.fr",
  password: "123456",
  password_confirmation: "123456",
  is_admin: true
)

User.create!(
  email: "user@roadstr.fr",
  password: "123456",
  password_confirmation: "123456",
  is_admin: false
)



# Créer des réservations avec des données préremplies
Reservation.create!([
  {
    start_date: Date.today,
    end_date: Date.today + 3.days,
    car: "Toyota Corolla",
    car_owner: "Jean Dupont",
    location: "Paris",
    price: 150,
    is_booked:false,
    is_payed:false,

  },
  {
    start_date: Date.today + 1.week,
    end_date: Date.today + 10.days,
    car: "Peugeot 208",
    car_owner: "Marie Curie",
    location: "Lyon",
    price: 120,
    is_booked:false,
    is_payed:false,


  },
  {
    start_date: Date.today + 2.weeks,
    end_date: Date.today + 17.days,
    car: "Renault Clio",
    car_owner: "Pierre Durand",
    location: "Marseille",
    price: 100,
    is_booked:false,
    is_payed:false,

  }
])

puts "Created #{Reservation.count} reservations!"
puts "Created #{User.count} users!"