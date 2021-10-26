# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
d1 =  Date.new(2021,10,20)
d2 =  Date.new(2021,10,24)
d3 = Date.new(2022,01,01)
d4 = Date.new(2022,01,02)



u1 = User.create!(firstname: "Fatima", surname: "Nim", email: "nf@email.com", password: "Password", password_confirmation: "Password")

r1 = Room.create(name: 'Room 1', capacity: 2, cost: 200, bed_no: 1, bed_type: 'King')
r2 = Room.create(name: 'Room 2', capacity: 4, cost: 400, bed_no: 2, bed_type: 'Double')
r3 = Room.create(name: 'Room 3', capacity: 1, cost: 100, bed_no: 1, bed_type: 'single')
r4 = Room.create(name: 'Room 4', capacity: 5, cost: 1000, bed_no: 3, bed_type: 'Double')


b1 = Booking.create(guests: 1, check_in: d3, check_out: d4, user_id: 1, room_id: 2, duration: nil )

