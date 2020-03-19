require 'rails_helper'

RSpec.describe '/pets/:id/edit', type: :feature do
  it "allows the user to edit pet info" do
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
    visit "/pets/#{pet1.id}"
    click_link "Update Pet"

    expect(current_path).to eq("/pets/#{pet1.id}/edit")

    fill_in "Image", with: "https://cdn.fstoppers.com/styles/large-16-9/s3/lead/2018/12/cat-parody-instagram-removal.jpg"
    fill_in "Description", with: "Weird AF but sweet."
    fill_in "Approximate age", with: 17
    fill_in "Sex", with: "CO"
    fill_in "Name", with: "Burt"
    click_button "Update Pet"

    new_pet = Pet.last

    expect(current_path).to eq("/pets/#{pet1.id}")
    expect(page).to have_css("img[src*=cat-parody-instagram-removal]")
    expect(page).to have_content(new_pet.name)
    expect(page).to have_content(new_pet.description)
    expect(page).to have_content(new_pet.approximate_age)
    expect(page).to have_content(new_pet.sex)
    expect(page).to have_content(new_pet.status)
  end
end
