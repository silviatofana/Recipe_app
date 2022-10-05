# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user1 = User.create(name: "ABDUL ALI")
p "Created #{User.count} Users"

food1  = Food.create(name: "Banana", measurement: "units", price: "$3", quantity: "10")
p "Created #{Food.count} Foods"
