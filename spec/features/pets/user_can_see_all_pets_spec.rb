require 'rails_helper'

RSpec.describe "/pets", type: :feature do
  it "has a link to the home page" do
    visit "/pets"
    click_link "Home"

    expect(current_path).to eq("/")
  end
end

RSpec.describe "/pets", typer: :feature do
  it "allows user to see all pets and their info" do
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
                      shelter: shelter1.name
                    )
    visit "/pets"

    expect(page).to have_css("img[src*=Sam_dog]")
    expect(page).to have_content(pet1.name)
    expect(page).to have_content(pet1.approximate_age)
    expect(page).to have_content(pet1.sex)
    expect(page).to have_content(pet1.shelter)
  end
end
