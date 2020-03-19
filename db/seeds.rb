# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

shelter1 = Shelter.create(name: 'FuzzTime',
                          address: "895 Fuzz St.",
                          city: "Westminster",
                          state: "CO",
                          zip: "80021"
                        )
pet1 = Pet.create(image: "https://upload.wikimedia.org/wikipedia/en/d/df/Sam_dog.jpg",
                  name: "Sam",
                  approximate_age: 23,
                  sex: "Male",
                  shelter_id: shelter1.id 
                )
