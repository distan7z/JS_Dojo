# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning Database..."

Submission.destroy_all
Exercice.destroy_all
User.destroy_all


puts "Database cleaned!"

puts "Creating users..."
User.create(username: "test-user", email: "test@email.com", password: "123456", country: "France")

puts "Creating exercices..."
Exercice.create(title: "Even or odd?",
  details: "const evenOrOdd = (number) => {
    // TODO: this should return 'even' if the number is even, 'odd' otherwise
  };",
  instructions: "Commençons par un algorithme très simple. Ouvre le fichier lib/even_or_odd.js. Code la fonction evenOrOdd qui prend un paramètre number (de type number) et retourne une string :'even' si le numéro est pair (0, 2, 4, etc.)
  'odd' si le numéro est impair (1, 3, 5, etc.)",
  exp: 10,
  testing_code: "",
  solution: "const evenOrOdd = (number) => {
  if (number % 2 === 0) {
    return ('even');
  } else {
    return ('odd');
  }};")
Exercice.create(title: "Looping",
  details: "const sumOfNegative = (numbers) => {
  // TODO: You are getting a `numbers` array. Return the sum of **negative** numbers only.
  };",
  instructions: "Ouvre le fichier lib/sum_of_negative.js. Code la fonction sumOfNegative qui prend un paramètre numbers (de type array) et retourne un nombre (number) : la somme des nombres négatifs dans l’array. Par exemple :

  sumOfNegative([-1, 4, -2, 9, 18]) doit retourner -3
  sumOfNegative([15, 16, 17, 1000]) doit retourner 0
  Si ton code fonctionne, tu devrais obtenir -6. Ajoute d’autres déclarations console.log dans la fonction sumOfNegative pour débugger ton code.",
  exp: 10, testing_code: "",
  solution: "const sumOfNegative = (numbers) => {
    // TODO: You are getting a `numbers` array. Return the sum of **negative** numbers only.
    let sum = 0;
    numbers.forEach((number) => {
      if (number < 0) {
        sum += number;
      }
    });
    return sum;
  };
  ")

puts "Creating submissions..."
Submission.create(attempts_count: 1, validation: false, user_id: User.first.id, exercice_id: Exercice.first.id)

puts "Database seeded!"
