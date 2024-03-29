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

COUNTRY = ["Australia", "Belgium", "Brazil", "Bulgaria", "Canada", "China", "Estonia", "France", "Germany", "India", "Italy", "Japan", "Netherland", "Norway", "Poland", "Russia", "Spain", "Sweden", "Sweden", "Switzerland", "United-Kingdom", "United-States"]

USERNAMES = [
  "shantel",
  "debra.bergnaum",
  "elia",
  "bobbie",
  "myles",
  "korey",
  "arnulfo_howell",
  "peg",
  "malik",
  "lashaunda",
  "maria.christiansen",
  "scottie",
  "lola",
  "clyde",
  "elfreda",
  "zane_stehr",
  "sharie.krajcik",
  "christy",
  "zandra_bernhard",
  "ouida_davis",
  "regenia",
  "grady.schiller",
  "stuart",
  "lou.ward",
  "efrain",
  "cathrine",
  "syreeta",
  "corey_gutkowski",
  "ronald_ondricka",
  "wilton_schinner",
  "billye_waters",
  "romona_willms",
  "ron",
  "eugene",
  "madlyn.fritsch",
  "rochelle_reilly",
  "tresa_crooks",
  "marion.veum",
  "aileen_ullrich",
  "sterling_connelly",
  "raleigh_schinner",
  "ralph_keeling",
  "arnulfo.leannon",
  "earnestine",
  "edgardo",
  "valentina_wuckert",
  "rosamaria",
  "carmelia",
  "alphonse_keebler",
  "lanita",
  "christin",
  "miguel_morissette",
  "olive",
  "josue",
  "sherilyn",
  "yasmine.blanda",
  "eugenio",
  "sherrill",
  "jay",
  "shonda",
  "shelton",
  "tiffany.kris",
  "glen",
  "delfina",
  "erinn.mraz",
  "brian.kuhn",
  "ashley.howell",
  "merissa.hammes",
  "naoma.fahey",
  "dorian.aufderhar",
  "selena.beahan",
  "milo_bartoletti",
  "heather",
  "jacques",
  "kayce_schumm",
  "giovanni",
  "jasmin",
  "arnoldo.bins",
  "raphael.rohan",
  "sheron.barrows",
  "ezra_carter",
  "hana_larson",
  "sanford",
  "angila",
  "jean",
  "rosetta",
  "tenesha_metz",
  "mazie",
  "meri",
  "edra",
  "lavette",
  "jonah.flatley",
  "lori_crist",
  "hilda",
  "king",
  "hwa",
  "ferne_hermann",
  "dustin",
  "van",
  "rich_ohara",
  "kasey.rutherford",
  "jed",
  "ebonie",
  "sandie.upton",
  "thomasena.schumm",
  "perry",
  "shawn.bernhard",
  "ariel_thompson",
  "chantelle.schowalter",
  "theodore",
  "wendell.bogan",
  "janean",
  "courtney",
  "clemente.abshire",
  "phillip.king",
  "margaret.gutkowski",
  "broderick.hoeger",
  "melissa.welch",
  "joette.harber",
  "vickey.welch",
  "val_rippin",
  "zachery_stoltenberg",
  "alexia.quigley",
  "mathew",
  "alline_herman",
  "dottie.monahan",
  "robert_kirlin",
  "rosalind",
  "dudley_simonis",
  "carmelina.marvin",
  "elijah",
  "benton",
  "colby_windler",
  "jasmine",
  "heriberto.vonrueden",
  "cary_gleason",
  "javier",
  "douglas.gutmann",
  "hubert_kuhlman",
  "keturah_stamm",
  "wilber_aufderhar",
  "craig",
  "kathrine",
  "delbert",
  "earl",
  "euna",
  "jerrod.prosacco",
  "fritz.towne",
  "gearldine_langosh",
  "hoyt",
  "domm"
]

def new_users
  (0..150).each do |i|
    User.create!(
      username: USERNAMES[i],
      email: "user_#{i}@mail.com",
      password: "azerty",
      country: COUNTRY.sample,
      exp: rand(5..110)
    )
  end
end

new_users()

puts "Creating exercices..."
exercices_path = "app/assets/exercice_rakes_data/"

exercice1 = Exercice.create!(title: "Even or odd?",
  details: "You modulo operator might be useful!",
  examples: "evenOrOdd(2) should return 'even'<br>
  evenOrOdd(7) should return 'odd'",
  instructions: "Code the evenOrOdd function which takes a number parameter (of type number) and returns a string : 'even' if the number is even (0, 2, 4, etc.)
  odd' if the number is odd (1, 3, 5, etc.)",
  function_name: "const evenOrOdd = (number) => {
  /*
    Enter your code here
  */
};",
  exp: 10,
  testing_code: File.read("#{exercices_path}evenOrOdd.json"),
  solution: "const evenOrOdd = (number) => {
  if (number % 2 === 0) {
    return ('even');
  } else {
    return ('odd');
  }};")

exercice2 = Exercice.create!(title: "Minutes To Second",
  details: "If you know how many seconds there is in a minute it should be straightforward.",
  examples: "minutesToSeconds(4) should return 240<br>
  minutesToSeconds(3) should return 180",
  instructions: "Write a function that takes an integer number of minutes and converts it to seconds.",
  function_name: "const minutesToSeconds = (minutes) => {
  /*
    Enter your code here
  */
};",
  exp: 5,
  testing_code: File.read("#{exercices_path}minutesToSeconds.json"),
  solution: "const minutesToSeconds = (minutes) => {
    return  minutes * 60;
  }
  ")

exercice3 = Exercice.create!(title: "Rest of Euclidian Division",
  details: "Using modulo will be very handy for this, but you can also use the integer divison operator.",
  examples: "restOfEuclidianDiv(1, 3) should return 1
    restOfEuclidianDiv(2, 4) should return 2<br>
    restOfEuclidianDiv(3, 3) should return 0",
  instructions: "Write a JavaScript program to return the rest of the euclidian division of two numbers. There is only one operator in JavaScript that can provide the remainder of a division. Two numbers are passed as parameters. The first parameter divided by the second parameter.",
  function_name: "const restOfEuclidianDiv = (a, b) => {
  /*
    Enter your code here
  */
};",
  exp: 5,
  testing_code: File.read("#{exercices_path}restOfEuclidianDiv.json"),
  solution: "function resteDiv(a, b) {
    return a % b;
  }
  " )


# ---------------------------------------------

exercice4 = Exercice.create!(title: "FizzBuzz",
  details: "Think about how you can use a loop to iterate over the numbers 1 to 100, and then use conditional statements to check if each number is divisible by 3, 5, or both.
  You will need to use the modulus operator to check for divisibility.",
  examples: "",
  instructions: "Write a function that prints the numbers from 1 to 100. For multiples of 3, print 'Fizz' instead of the number. For multiples of 5, print 'Buzz' instead of the number. For numbers that are multiples of both 3 and 5, print 'FizzBuzz'",
  exp: 10,
  testing_code: File.read("#{exercices_path}restOfEuclidianDiv.json"),
  solution: "for (let i = 1; i <= 100; i++) {
    if (i % 3 === 0 && i % 5 === 0) {
      console.log('FizzBuzz');
    } else if (i % 3 === 0) {
      console.log('Fizz');
    } else if (i % 5 === 0) {
      console.log('Buzz');
    } else {
      console.log(i);
    }
  }
  " )

exercice5 = Exercice.create!(title: "Find the maximum value in an array",
  details: "Think about how you can use a loop to iterate over the array and keep track of the maximum value you have seen so far.
  You will need to initialize a variable to hold the maximum value before the loop starts.",
  examples: "",
  instructions: "Write a function that takes an array of numbers as an argument and returns the maximum value in the array.",
  exp: 5,
  testing_code: File.read("#{exercices_path}restOfEuclidianDiv.json"),
  solution: "function findMax(arr) {
    let max = arr[0];
    for (let i = 1; i < arr.length; i++) {
      if (arr[i] > max) {
        max = arr[i];
      }
    }
    return max;
  }
  " )


exercice6 = Exercice.create!(title: "Reverse a string",
  details: "Think about how you can use a loop to iterate over the characters in the string and build a new string that is the reverse of the original string.
  You will need to use string concatenation to build the new string.",
  examples: "",
  instructions: "Write a function that takes a string as an argument and returns the reversed version of the string.
  ",
  exp: 5,
  testing_code: File.read("#{exercices_path}restOfEuclidianDiv.json"),
  solution: "function reverseString(str) {
    return str.split("").reverse().join("");
  }
  " )

exercice7 = Exercice.create!(title: "Palindrome checker",
  details: "Think about how you can use two pointers to check if the string is a palindrome.
  You will need to compare the characters at the beginning and end of the string, and then move the pointers towards the middle of the string until they meet.",
  examples: "",
  instructions: "Write a function that takes a string as an argument and returns true if the string is a palindrome (reads the same forwards and backwards), false otherwise.",
  exp: 5,
  testing_code: File.read("#{exercices_path}restOfEuclidianDiv.json"),
  solution: "function isPalindrome(str) {
    const reversed = str.split("").reverse().join("");
    return str === reversed;
  }
  " )

exercice8 = Exercice.create!(title: "Capitalize the first letter of each word in a string",
  details: "Think about how you can use the split method to break the string into an array of words, and then use a loop to iterate over the words in the array.
  You will need to use string slicing and the toUpperCase method to capitalize the first letter of each word, and then concatenate the capitalized letter with the rest of the word.",
  examples: "",
  instructions: "Write a function that takes a string as an argument and returns a new string where the first letter of each word is capitalized.",
  exp: 10,
  testing_code: File.read("#{exercices_path}restOfEuclidianDiv.json"),
  solution: "function capitalizeWords(str) {
    const words = str.split(" ");
    const capitalized = words.map(word => {
      return word[0].toUpperCase() + word.slice(1);
    });
    return capitalized.join(" ");
  }
  " )

exercice9 = Exercice.create!(title: "Check if a number is prime",
  details: "Think about how you can use a loop to iterate over the numbers from 2 up to the square root of the input number.
  You will need to use the modulus operator to check if the input number is divisible by any of the numbers in the loop.",
  examples: "",
  instructions: "Write a function that takes a number as an argument and returns true if the number is prime (only divisible by 1 and itself), false otherwise.",
  exp: 10,
  testing_code: File.read("#{exercices_path}restOfEuclidianDiv.json"),
  solution: "function isPrime(num) {
    if (num <= 1) {
      return false;
    }
    for (let i = 2; i <= Math.sqrt(num); i++) {
      if (num % i === 0) {
        return false;
      }
    }
    return true;
  }
  " )

exercice10 = Exercice.create!(title: "Find the factorial of a number",
  details: "Think about how you can use a loop to iterate from 1 up to the input number, and then multiply each number in the loop with the product of all previous numbers to get the factorial.",
  examples: "",
  instructions: "Write a function that takes a number as an argument and returns the factorial of that number (the product of all positive integers up to and including that number).",
  exp: 10,
  testing_code: File.read("#{exercices_path}restOfEuclidianDiv.json"),
  solution: "function factorial(num) {
    let result = 1;
    for (let i = 2; i <= num; i++) {
      result *= i;
    }
    return result;
  }
  " )

exercice11 = Exercice.create!(title: "Count the number of vowels in a string",
  details: "Think about how you can use a loop to iterate over the characters in the string, and then use conditional statements to check if each character is a vowel.
  You will need to initialize a counter variable before the loop starts.",
  examples: "",
  instructions: "Write a function that takes a string as an argument and returns the number of vowels (a, e, i, o, u) in the string.",
  exp: 15,
  testing_code: File.read("#{exercices_path}restOfEuclidianDiv.json"),
  solution: "function countVowels(str) {
    const vowels = ['a', 'e', 'i', 'o', 'u'];
    let count = 0;
    for (let char of str.toLowerCase()) {
      if (vowels.includes(char)) {
        count++;
      }
    }
    return count;
  }
  " )

exercice12 = Exercice.create!(title: "Flatten an array",
  details: "Think about how you can use nested loops to iterate over the arrays in the input array, and then concatenate the elements from the sub-arrays into a new array.",
  examples: "",
  instructions: "Write a function that takes an array of arrays as an argument and returns a new array that is the flattened version of the original array (all elements from all sub-arrays concatenated into a single array).",
  exp: 10,
  testing_code: File.read("#{exercices_path}restOfEuclidianDiv.json"),
  solution: "function flatten(arr) {
    const flattened = [];
    for (let subArr of arr) {
      for (let element of subArr) {
        flattened.push(element);
      }
    }
    return flattened;
  }
  " )

exercice13 = Exercice.create!(title: "Merge two sorted arrays into one sorted array",
  details: "Think about how you can use two pointers, one for each input array, to compare elements.
  You will need to add the smaller of the two elements to a new array, and then move the corresponding pointer forward.
  Repeat until all elements from both arrays have been added to the new array.",
  examples: "",
  instructions: "Write a function that takes two sorted arrays as arguments and returns a new sorted array that contains all elements from both input arrays.",
  exp: 20,
  testing_code: File.read("#{exercices_path}restOfEuclidianDiv.json"),
  solution: "function mergeArrays(arr1, arr2) {
    const merged = [];
    let i = 0;
    let j = 0;
    while (i < arr1.length && j < arr2.length) {
      if (arr1[i] < arr2[j]) {
        merged.push(arr1[i]);
        i++;
      } else {
        merged.push(arr2[j]);
        j++;
      }
    }
    while (i < arr1.length) {
      merged.push(arr1[i]);
      i++;
    }
    while (j < arr2.length) {
      merged.push(arr2[j]);
      j++;
    }
    return merged;
  }
  " )

exercice14 = Exercice.create!(title: "Find Longest Word in String",
  details: "Write a function that takes in a string and returns the longest word in the string.
  If there are two or more words that are tied for the longest word, return the first one.",
  examples: "",
  instructions: "For example, given the string 'The quick brown fox jumped over the lazy dog', the function should return 'jumped'.  ",
  exp: 20,
  testing_code: File.read("#{exercices_path}restOfEuclidianDiv.json"),
  solution: "function findLongestWord(str) {
    var words = str.split(' ');

    var longestWord = '';
    var longestLength = 0;

    for (var i = 0; i < words.length; i++) {
      if (words[i].length > longestLength) {
        longestWord = words[i];
        longestLength = words[i].length;
      }
    }
    return longestWord;
  }
  " )


exercice15 = Exercice.create!(title: "Find Intersection of Two Arrays",
  details: "For example, given the arrays [1, 2, 3, 4, 5] and [3, 4, 5, 6, 7], the function should return [3, 4, 5].
  Note that the order of the elements in the returned array does not matter.",
  examples: "",
  instructions: "Implement a function that takes in two arrays of integers, arr1 and arr2, and returns a new array containing the intersection of the two arrays. The intersection should be computed based on the values in the arrays, not the indices.",
  exp: 20,
  testing_code: File.read("#{exercices_path}restOfEuclidianDiv.json"),
  solution: "function findIntersection(arr1, arr2) {
    var intersection = [];

    for (var i = 0; i < arr1.length; i++) {
      if (arr2.indexOf(arr1[i]) !== -1 && intersection.indexOf(arr1[i]) === -1) {
        intersection.push(arr1[i]);
      }
    }
    return intersection;
  }

  ")


puts "Creating submissions..."
Submission.create!(attempts_count: 3, validation: true, user_id: User.last.id, exercice_id: exercice4.id)
Submission.create!(attempts_count: 8, validation: true, user_id: User.last.id, exercice_id: exercice6.id)
Submission.create!(attempts_count: 5, validation: true, user_id: User.last.id, exercice_id: exercice7.id)
Submission.create!(attempts_count: 12, validation: true, user_id: User.last.id, exercice_id: exercice14.id)

puts "Creating tags..."
Tag.create!(title: "Basic", exercice: exercice1)
Tag.create!(title: "Basic", exercice: exercice2)
Tag.create!(title: "Basic", exercice: exercice3)
Tag.create!(title: "Basic", exercice: exercice4)
Tag.create!(title: "Numbers", exercice: exercice1)
Tag.create!(title: "Numbers", exercice: exercice2)
Tag.create!(title: "Numbers", exercice: exercice3)
Tag.create!(title: "Numbers", exercice: exercice9)
Tag.create!(title: "Numbers", exercice: exercice10)
Tag.create!(title: "String", exercice: exercice2)
Tag.create!(title: "String", exercice: exercice6)
Tag.create!(title: "String", exercice: exercice7)
Tag.create!(title: "String", exercice: exercice8)
Tag.create!(title: "Sorting", exercice: exercice13)
Tag.create!(title: "Date Time", exercice: exercice3)
Tag.create!(title: "Express", exercice: exercice3)
Tag.create!(title: "Loops", exercice: exercice4)
Tag.create!(title: "Loops", exercice: exercice9)
Tag.create!(title: "Loops", exercice: exercice10)
Tag.create!(title: "Loops", exercice: exercice11)
Tag.create!(title: "Loops", exercice: exercice12)
Tag.create!(title: "Loops", exercice: exercice14)
Tag.create!(title: "Loops", exercice: exercice15)
Tag.create!(title: "Conditional", exercice: exercice4)
Tag.create!(title: "Conditional", exercice: exercice7)
Tag.create!(title: "Conditional", exercice: exercice9)
Tag.create!(title: "Conditional", exercice: exercice14)
Tag.create!(title: "Conditional", exercice: exercice15)
Tag.create!(title: "Statements", exercice: exercice4)
Tag.create!(title: "Statements", exercice: exercice8)
Tag.create!(title: "Statements", exercice: exercice9)
Tag.create!(title: "Arrays", exercice: exercice5)
Tag.create!(title: "Arrays", exercice: exercice12)
Tag.create!(title: "Arrays", exercice: exercice13)
Tag.create!(title: "Arrays", exercice: exercice14)
Tag.create!(title: "Arrays", exercice: exercice15)
Tag.create!(title: "Functions", exercice: exercice5)
Tag.create!(title: "Functions", exercice: exercice6)
Tag.create!(title: "Functions", exercice: exercice7)
Tag.create!(title: "Functions", exercice: exercice8)
Tag.create!(title: "Functions", exercice: exercice9)
Tag.create!(title: "Functions", exercice: exercice10)
Tag.create!(title: "Functions", exercice: exercice11)
Tag.create!(title: "Functions", exercice: exercice12)
Tag.create!(title: "Functions", exercice: exercice13)
Tag.create!(title: "Algorithm", exercice: exercice13)


puts "Database seeded!"


#TO DO CHALLENGE
