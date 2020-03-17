require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "has a link to the home page" do
    visit "/shelters"
    click_link "Home"

    expect(current_path).to eq("/")
  end
end

RSpec.describe "shelters index page", type: :feature do
  it "can see all shelter names" do
    shelter1 = Shelter.create(name: 'FuzzTime',
                              address: "895 Fuzz St.",
                              city: "Westminster",
                              state: "CO",
                              zip: "80021")
    shelter2 = Shelter.create(name: 'DogPaws',
                              address: "123 Pup St.",
                              city: "Arvada",
                              state: "CO",
                              zip: "80005")
    visit "/shelters"

    expect(page).to have_content(shelter1.name)
    expect(page).to have_content(shelter2.name)
  end
end

RSpec.describe "shelters index page/:id", type: :feature do
  it "can show a shelters info for given id" do
    shelter1 = Shelter.create(name: 'FuzzTime',
                              address: "895 Fuzz St.",
                              city: "Westminster",
                              state: "CO",
                              zip: "80021")
    shelter2 = Shelter.create(name: 'DogPaws',
                              address: "123 Pup St.",
                              city: "Arvada",
                              state: "CO",
                              zip: "80005")
    visit "/shelters/#{shelter1.id}"

    expect(page).to have_content(shelter1.name)
    expect(page).to have_content(shelter1.address)
    expect(page).to have_content(shelter1.city)
    expect(page).to have_content(shelter1.state)
    expect(page).to have_content(shelter1.zip)

    visit "/shelters/#{shelter2.id}"

    expect(page).to have_content(shelter2.name)
    expect(page).to have_content(shelter2.address)
    expect(page).to have_content(shelter2.city)
    expect(page).to have_content(shelter2.state)
    expect(page).to have_content(shelter2.zip)
  end
end

RSpec.describe "shelters index page/new" do
  it "allows the user to create a new shelter" do
    visit "/shelters"
    click_link "New Shelter"

    expect(current_path).to eq("/shelters/new")

    fill_in "Name", with: "ChipmunkSanctuary"
    fill_in "Address", with: "555 Cheeky St."
    fill_in "City", with: "Denver"
    fill_in "State", with: "CO"
    fill_in "Zip", with: "80000"
    click_button "Submit"

    expect(current_path).to eq("/shelters")
    expect(page).to have_content("ChipmunkSanctuary")

    click_link "ChipmunkSanctuary"
    expect(page).to have_content("ChipmunkSanctuary")
    expect(page).to have_content("555 Cheeky St.")
    expect(page).to have_content("Denver")
    expect(page).to have_content("CO")
    expect(page).to have_content("80000")
  end
end
