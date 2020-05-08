# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'open-uri'

Place.destroy_all


#Place 1

#file = URI.open('https://res.cloudinary.com/dhkoueugk/image/upload/v1588928159/Perretes/camposoto_rkxsmx.jpg')

camposoto = Place.create(
    name: 'Camposoto',
    description: 'Pequena playa que se encuentra en San Fernando',
    address:'',
    latitude: 36.402305,
    longitude:-6.217831,
)

#camposoto.photos.attach(io:file, filename:'playa.jpg', content_type: 'image?jpg')


#Place 2

#file = URI.open('https://res.cloudinary.com/dhkoueugk/image/upload/v1588928159/Perretes/7_PLAYA_DEL_CASTELLAR_ku0fqb.jpg             ')

castellar = Place.create(
    name: 'Castellar',
    description: 'Pequena playa que se encuentra Murcia',
    address:'',
    latitude:37.5613231,
    longitude:-1.2965043,
)

#castellar.photos.attach(io:file, filename:'playa.jpg', content_type: 'image?jpg')#Place 2


#Place 3


#file = URI.open('https://res.cloudinary.com/dhkoueugk/image/upload/v1588928159/Perretes/7_PLAYA_DEL_CASTELLAR_ku0fqb.jpg             ')

st = Place.create(
    name: 'Fd',
    description: 'Pequena playa que se encuentra Murcia',
    address:'',
    latitude:37.5613231,
    longitude:-1.2965043,
)

#castellar.photos.attach(io:file, filename:'playa.jpg', content_type: 'image?jpg')


