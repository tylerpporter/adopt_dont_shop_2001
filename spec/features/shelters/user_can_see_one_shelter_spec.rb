require 'rails_helper'

RSpec.describe "/shelters/:id", type: :feature do
  it "has a link to the home page" do
    visit "/shelters"
    click_link "Home"

    expect(current_path).to eq("/")
  end
end

RSpec.describe "/shelters/:id", type: :feature do
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
