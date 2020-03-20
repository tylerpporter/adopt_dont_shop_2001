# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Shelter.destroy_all
Pet.destroy_all

shelter1 = Shelter.create(name: 'FuzzTime',
                          address: "895 Fuzz St.",
                          city: "Westminster",
                          state: "CO",
                          zip: "80021"
  )
shelter2 = Shelter.create(name: 'KatsR-Us',
                          address: "123 Purr Pl.",
                          city: "Arvada",
                          state: "CO",
                          zip: "80005"
  )
pet1 = Pet.create(image: "https://upload.wikimedia.org/wikipedia/en/d/df/Sam_dog.jpg",
                  name: "Sam",
                  description: "Crazy AF and mean...",
                  approximate_age: 23,
                  sex: "Male",
                  shelter_id: shelter1.id,
  )
pet2 = Pet.create(image: "https://cdn.fstoppers.com/styles/large-16-9/s3/lead/2018/12/cat-parody-instagram-removal.jpg",
                  description: "Weird AF but sweet.",
                  name: "Burt",
                  approximate_age: 47,
                  sex: "Male",
                  shelter_id: shelter1.id,
  )
pet3 = Pet.create(image: "https://api.time.com/wp-content/uploads/2014/06/49cb79d35e3640a1b005287de39f1754-0.jpg",
               name: "Darlin",
               description: "Loves to cuddle, needs daily ointment.",
               approximate_age: 2,
               sex: "Female",
               shelter_id: shelter2.id
  )
