# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Running seeds"
   Employee.create([{ name: 'NN', phone: '677619619', credit: 0, description: "Cuenta numero uno" }, { name: 'Paula', phone: '689619619', credit: 0, description: "Sexy lady, solo pa ligar"}])
   roque = Employee.create(name: 'Faggotier', phone: '629118235', credit: -7800, description: "Con esa duda no hay que dudar")
   a = Employee.create(name: 'Fin Gallager', phone: '629113811', credit: 0, description: "Tod me he was going to get 50 ppl")
   r = Employee.create(name: 'Gaspar', phone: '662911867', credit: 1, description: "can't design but can he speak")
   t = Employee.create(name: 'Gayguel', phone: '629128670', credit: 20, description: "Manager in charge")

   n = Landlord.create(name: 'Jorge', phone: '62901867', address: "Valencia Road", description: "Solo las Navelinas", fields: 3)

   
puts "done"