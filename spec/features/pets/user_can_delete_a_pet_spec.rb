require 'rails_helper'

RSpec.describe 'DELETE /pets/:id', type: :feature do
  it "allows the user to delete the pet with that id" do
    shelter1 = Shelter.create(name: 'FuzzTime',
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
                      shelter_id: shelter1.id,
                    )
    pet2 = Pet.create(image: "https://cdn.fstoppers.com/styles/large-16-9/s3/lead/2018/12/cat-parody-instagram-removal.jpg",
                      description: "Weird AF but sweet.",
                      name: "Burt",
                      approximate_age: 47,
                      sex: "Male",
                      shelter_id: shelter1.id,
                    )
    visit "/pets"

    expect(page).to have_content(pet1.name)

    visit "/pets/#{pet1.id}"
    click_link "Delete Pet"

    expect(current_path).to eq("/pets")
    expect(page).to_not have_content(pet1.name)
    expect(page).to have_content(pet2.name)
  end
end
