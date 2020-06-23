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

camposoto = Place.create(
    name: 'Camposoto',
    description: 'La zona de playa canina es la que se encuentra entre el acceso 8 y la Punta de Boquerón, más o menos donde se indica en el mapa. Debes caminar unos 2km hasta llegar a la zona para perros (unos 20 minutos a pie).

Esta playa canina ha sido motivo de muchas quejas por parte de los usuarios debido a las malas condiciones y la longitud del sendero que hay de recorrer para acceder a la playa.',
    address:'',
    category: 'Playa',
    latitude:36.402305,
    longitude:-6.217831,
    user: u1
)

camposoto.photo.attach(io:file, filename:'playa.jpg', content_type: 'image/jpeg')


#Place 2

file1 = URI.open('https://res.cloudinary.com/dhkoueugk/image/upload/v1588928159/Perretes/7_PLAYA_DEL_CASTELLAR_ku0fqb.jpeg')

castellar = Place.create(
    name: 'Castellar',
    description: 'Pequena playa que se encuentra Murcia',
    address:'',
    category: 'Playa',
    latitude:37.5613231,
    longitude:-1.2965043,
    user: u1
)

castellar.photo.attach(io:file1, filename:'playa.jpg', content_type: 'image/jpg')#Place 2

# retiro = Place.create(
#     name: 'El Retiro',
#     description: 'Madri esto, Madri lo otro',
#     address:'',
#     category: 'Parque',
#     latitude:40.4151561,
#     longitude:-3.6807313,
#     user: u1
# )

puts 'Places created'
puts "You now have #{Place.count} places"
puts "You now have #{User.count} users"
