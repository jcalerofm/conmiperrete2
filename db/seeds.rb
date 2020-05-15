# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'open-uri'

puts 'Deleting all places'
Place.destroy_all
puts 'Deleting all user'
User.destroy_all


puts 'Creating a User'
u1 = User.create(
  email: "123@123.com",
  password: 123456
  )
puts 'Finished'
#Place 1

file = URI.open('https://res.cloudinary.com/dhkoueugk/image/upload/v1588928159/Perretes/camposoto_rkxsmx.jpg')

puts 'Creating Places'

camposoto = Place.create!(
    name: 'Camposoto',
    description: 'Pequena playa que se encuentra en San Fernando',
    address:'',
    latitude: 36.402305,
    longitude:-6.217831,
    user: u1
)

camposoto.photos.attach(io:file, filename:'playa.jpg', content_type: 'image?jpg')


#Place 2

file1 = URI.open('https://res.cloudinary.com/dhkoueugk/image/upload/v1588928159/Perretes/7_PLAYA_DEL_CASTELLAR_ku0fqb.jpg')

castellar = Place.create(
    name: 'Castellar',
    description: 'Pequena playa que se encuentra Murcia',
    address:'',
    latitude:37.5613231,
    longitude:-1.2965043,
    user: u1
)

castellar.photos.attach(io:file1, filename:'playa.jpg', content_type: 'image?jpg')#Place 2


puts 'Places created'
puts "You now have #{Place.count} places"
puts "You now have #{User.count} users"
