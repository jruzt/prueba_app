# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(full_name: "Jose Ruz",
            email: "jruz@example.com",
            password: "123123",
            password_confirmation: "123123",
            admin: true)

User.create(full_name: "Alberto",
            email: "aruz@example.com",
            password: "123123",
            password_confirmation: "123123")

Movie.create(name: "Chucky",
             description: "Pelicula acerca de un muñeco diabolico",
             price: 20,
             trailer: "https://www.youtube.com/watch?v=Gz4e6Viq9H0")

Movie.create(name: "Chucky 2",
             description: "Continuación de la primera parte",
             price: 25,
             trailer: "https://www.youtube.com/watch?v=QQ578YDz-sQ")

Movie.create( name: "Click",
              description: "Buena película",
              price: 25,
              trailer: "https://www.youtube.com/watch?v=pWBXMNcKhj4")
#
10.times do |n|
  name =  n == 0 ? "Chucky 4" : "Chucky #{n+4}"
  description = n == 0 ? "Parte 4" : "Parte #{n+4}"
  price = Random.rand(20..30)
  Movie.create(name: name,
               description: description,
               price: price)
end
# 10.times do |n|
#   name = Faker::Name.name
#   email = n == 0 ? "example-2@example.com" : "example-#{n+2}@example.com"
#   password = "123123"
#   User.create(full_name: name,
#               email: email,
#               password: password,
#               password_confirmation: password)
# end
#
# 15.times do |n|
#   title = Faker::Lorem.sentence
#   description = Faker::Lorem.sentence
#   #copies = Random.rand(1..5)
#   Movie.create(name: title,
#                description: description)
# end

# User.count.times do |n|
#   user_id = n+1
#   movie_id = n+1
#   total = 10.0
#   Cart.create(user_id: user_id,
#               movie_id: movie_id,
#               total: total,
#               permited: true)
# end









