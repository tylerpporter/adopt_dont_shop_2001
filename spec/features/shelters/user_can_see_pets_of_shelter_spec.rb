require 'rails_helper'

RSpec.describe '/shelters/:id/pets', type: :feature do
  it "allows user to see all pets for shelter with that id" do
    shelter = Shelter.create(name: 'FuzzTime',
                              address: "895 Fuzz St.",
                              city: "Westminster",
                              state: "CO",
                              zip: "80021"
                            )
    pet1 = Pet.create(image: "https://upload.wikimedia.org/wikipedia/en/d/df/Sam_dog.jpg",
                      name: "Sam",
                      approximate_age: 23,
                      sex: "Male",
                      shelter_id: shelter.id
                    )
    pet2 = Pet.create(image: "https://cdn.fstoppers.com/styles/large-16-9/s3/lead/2018/12/cat-parody-instagram-removal.jpg",
                      name: "Burt",
                      approximate_age: 47,
                      sex: "Male",
                      shelter_id: shelter.id
                    )
    visit "/shelters/#{shelter.id}/pets"

    expect(page).to have_css("img[src*=Sam_dog]")
    expect(page).to have_content(pet1.name)
    expect(page).to have_content(pet1.approximate_age)
    expect(page).to have_content(pet1.sex)
    expect(page).to have_css("img[src*=cat-parody-instagram-removal]")
    expect(page).to have_content(pet2.name)
    expect(page).to have_content(pet2.approximate_age)
    expect(page).to have_content(pet2.sex)
    expect(page).to have_content("Pet Count: #{Pet.count}")
  end
end
