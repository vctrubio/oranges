# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Running seeds"
   Employee.create([{ name: 'Star Wars', phone: '677619619', credit: 0 }, { name: 'Lord of the Rings', phone: '689619619', credit: 0 }])
   roque = Employee.create(name: 'Roque', phone: '62911823', credit: 0)
   a = Employee.create(name: 'Andy', phone: '629113811', credit: 1)
   r = Employee.create(name: 'Roger', phone: '62911867', credit: 1)
   t = Employee.create(name: 'Titor', phone: '62912867', credit: 2000, description: "manager in charge")
   n = Employee.create(name: 'Nacho', phone: '62901867', credit: 0)

   
puts "done"