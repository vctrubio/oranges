# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Running seeds"
   Employee.create([{ name: 'NN', phone: '677619619', credit: 5 }, { name: 'LordRing', phone: '689619619', credit: 0 }])
   roque = Employee.create(name: 'Faggoty', phone: '62911823', credit: 1)
   a = Employee.create(name: 'Speedy', phone: '629113811', credit: 1)
   r = Employee.create(name: 'Cunty', phone: '62911867', credit: 1)
   t = Employee.create(name: 'Titor', phone: '62912867', credit: 20, description: "manager in charge")
   n = Employee.create(name: 'Nacho', phone: '62901867', credit: 0)

   n = Landlord.create(name: 'Jorge', phone: '62901867', address: "Valencia Road", description: "Solo las Navelinas", fields: 3)

   
puts "done"