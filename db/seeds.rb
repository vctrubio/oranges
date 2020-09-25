# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Running seeds"
   james = Employee.create([{ name: 'Star Wars', phone: '619619', credit: 0 }, { name: 'Lord of the Rings', phone: '619619', credit: 0 }])
   Employee.create(name: 'Luke', phone: '629118', credit: 1)
puts "done"