# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!(name: "HungAd",
    email: "admin@polkadots.com",
    password:               "polkadots",
    password_confirmation:  "polkadots",
    phone:                  "0923115467",
    address:                "KTX Khu A - ĐHQG, TPHCM"
    cover_color:            
)