require 'rails_helper'

RSpec.describe '/pets/:id', type: :feature do
  it "allows user to see a pets info for given id" do
    shelter = Shelter.create(name: 'FuzzTime',
                              address: "895 Fuzz St.",
                              city: "Westminster",
                              state: "CO",
                              zip: "80021"
                            )
    pet1 = Pet.create(image: "https://upload.wikimedia.org/wikipedia/en/d/df/Sam_dog.jpg",
                      name: "Sam",
                      description: "Crazy AF and mean...",
                      approximate_age: 23,
                      sex: "Male",
                      shelter_id: shelter.id,
                      status: "Adoptable"
                    )
    pet2 = Pet.create(image: "https://cdn.fstoppers.com/styles/large-16-9/s3/lead/2018/12/cat-parody-instagram-removal.jpg",
                      description: "Weird AF but sweet.",
                      name: "Burt",
                      approximate_age: 47,
                      sex: "Male",
                      shelter_id: shelter.id,
                      status: "Adoptable"
                    )
    visit "/pets/#{pet1.id}"

    expect(page).to have_css("img[src*=Sam_dog]")
    expect(page).to have_content(pet1.name)
    expect(page).to have_content(pet1.description)
    expect(page).to have_content(pet1.approximate_age)
    expect(page).to have_content(pet1.sex)
    expect(page).to have_content(pet1.status)

    visit "/pets/#{pet2.id}"

    expect(page).to have_css("img[src*=cat-parody-instagram-removal]")
    expect(page).to have_content(pet2.name)
    expect(page).to have_content(pet2.description)
    expect(page).to have_content(pet2.approximate_age)
    expect(page).to have_content(pet2.sex)
    expect(page).to have_content(pet2.status)
  end
end
