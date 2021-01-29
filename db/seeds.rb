require 'open-uri'

puts 'Deleting all places'
Place.destroy_all
puts 'Deleting all user'
User.destroy_all


puts 'Creating a User'
u1 = User.create(
	username: 'Mike',
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

#Place 3



rubina = Place.create(
    name: 'La Rubina',
    description: 'Playa de arena fina y aguas cristalinas',
    address:'',
    category: 'Playa',
    latitude:42.25413581503821, 
    longitude:3.1425032409568954,
    user: u1
)

ribera = Place.create(
    name: 'La Ribera',
    description: 'No toda la playa es canina, busca las señales verdes que delimitan la zona especial para perros',
    address:'',
    category: 'Playa',
    latitude:35.88699760946503, 
    longitude:-5.315911953245997 ,
    user: u1
)
vallcarca = Place.create(
    name: 'Vallcarca',
    description: 'Se trata de una playa natural, carente de servicios, y muy visitada por los habitantes de la ciudad de Barcelona',
    address:'',
    category: 'Playa',
    latitude:41.23967556768582,  
    longitude:1.8662282565050197,
    user: u1
)
cubelles = Place.create(
    name: 'Cubelles',
    description: 'Situada junto a una central térmica y formada por piedra y arena',
    address:'',
    category: 'Playa',
    latitude:41.19557457265099,   
    longitude:1.6558589629534477,
    user: u1
)
cementiri = Place.create(
    name: 'Cementiri',
    description: 'Cala de roca y piedras',
    address:'',
    category: 'Playa',
    latitude:40.88997656985009,    
    longitude:0.8111150222279314,
    user: u1
)
bassa = Place.create(
    name: "Bassa d'Arena",
    description: 'La playa para perros de Tarragona mejor valorada. Rodeada de un entorno virgen y suelo de arena fina',
    address:'',
    category: 'Playa',
    latitude:40.88997656985009,    
    longitude:0.8111150222279314,
    user: u1
)
alforja = Place.create(
    name: "Playa de la Riera d’Alforja ",
    description: ' Playa de piedra ubicada en la desembocadura de la Riera',
    address:'',
    category: 'Playa',
    latitude:41.064379913465714,     
    longitude:1.0566609460325616,
    user: u1
)
xarco = Place.create(
    name: "Playa del Xarco",
    description: 'Pequeña cala de piedras y difícil acceso situada al sur del municipio y carente de servicios',
    address:'',
    category: 'Playa',
    latitude: 38.49059943399435,   
    longitude: -0.2813647698371917,
    user: u1
)
mym = Place.create(
    name: "Mar y Montaña",
    description: 'Pequeña y tranquila playa de piedras',
    address:'',
    category: 'Playa',
    latitude: 38.62279373223248,
    longitude: -0.022126515344187216,
    user: u1
)





puts 'Places created'
puts "You now have #{Place.count} places"
puts "You now have #{User.count} users"
