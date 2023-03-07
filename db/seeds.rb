# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning Database..."

Exercice.destroy_all
User.destroy_all
Submission.destroy_all

puts "Database cleaned!"

puts "Creating users..."
User.create(username: "test-user", email: "test@email.com", password: "123456", country: "France")

puts "Creating exercices..."
Exercice.create(title: "Exercice 1", details: "Details 1", instructions: "Instruction 1", exp: 10, testing_code: "", solution: "abcd")

puts "Creating submissions..."
Submission.create(attempts_count: 1, validation: false, user_id: User.first.id, exercice_id: Exercice.first.id)

puts "Database seeded!"
