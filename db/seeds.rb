require "faker"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning Database..."

Tag.destroy_all
Submission.destroy_all
Exercice.destroy_all
User.destroy_all

puts "Database cleaned!"

puts "Creating users..."

COUNTRY = [
  "Germany",
  "Spain",
  "France"
]

def new_users
  for i in (0..10)
    User.create!(username: Faker::Internet.username, email: "user_#{i}@mail.com",password: "azerty", country: COUNTRY.sample)
  end
end
new_users

puts "Creating exercices..."
exercices_path = "app/assets/exercice_rakes_data/"

exercice1 = Exercice.create!(title: "Even or odd?",
  details: "const evenOrOdd = (number) => {
    // TODO: this should return 'even' if the number is even, 'odd' otherwise
  };",
  instructions: "Let's start with a very simple algorithm. Open the file lib/even_or_odd.js. Code the evenOrOdd function which takes a number parameter (of type number) and returns a string : 'even' if the number is even (0, 2, 4, etc.)
  odd' if the number is odd (1, 3, 5, etc.)",
  exp: 10,
  testing_code: File.read("#{exercices_path}evenOrOdd.json"),
  solution: "const evenOrOdd = (number) => {
  if (number % 2 === 0) {
    return ('even');
  } else {
    return ('odd');
  }};")

exercice2 = Exercice.create!(title: "Minutes To Second",
  details: "Example:
  minuteToSecond(4) ➞ 240

  minuteToSecond(3) ➞ 180",
  instructions: "Write a function that takes an integer number of minutes and converts it to seconds.",
  exp: 5,
  testing_code: File.read("#{exercices_path}minutesToSeconds.json"),
  solution: "function minuteToSecond(minutes) {
    return  minutes * 60;
  }
  ")

exercice3 = Exercice.create!(title: "Rest of numbers",
  details: "Example:
  remainDiv(1, 3) ➞ 1

  remainderDiv(2, 4) ➞ 2

  remainderDiv(3, 3) ➞ 0",
  instructions: "Write a JavaScript program to return the rest of two numbers. There is only one operator in JavaScript that can provide the remainder of a division. Two numbers are passed as parameters. The first parameter divided by the second parameter.",
  exp: 5,
  testing_code: File.read("#{exercices_path}restOfNumbers.json"),
  solution: "function resteDiv(a, b) {
    return a % b;
  }
  " )


puts "Creating submissions..."
Submission.create!(attempts_count: 1, validation: false, user_id: User.first.id, exercice_id: Exercice.first.id)

puts "Creating tags..."
Tag.create!(title: "Fundamentals", exercice: exercice1)
Tag.create!(title: "Fundamentals", exercice: exercice2)
Tag.create!(title: "Fundamentals", exercice: exercice3)
Tag.create!(title: "Numbers", exercice: exercice1 )
Tag.create!(title: "Numbers", exercice: exercice2)
Tag.create!(title: "Numbers", exercice: exercice3)
Tag.create!(title: "String", exercice: exercice2)
Tag.create!(title: "Date Time", exercice: exercice3)
Tag.create!(title: "Express", exercice: exercice3)


puts "Database seeded!"


#TO DO TAGS

#TO DO CHALLENGE
