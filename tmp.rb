require 'faker'

(1..150).each do |i|
  puts Faker::Internet.username
end
