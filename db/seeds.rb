# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!(name: "Bilbo Baggins", email: "thetrueringmaster@email.com", password: "thereandbackagain", password_confirmation: "thereandbackagain", api_key: "fd1b4597c8497484027e4a321d33cd23")
