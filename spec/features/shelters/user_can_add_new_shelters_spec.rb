require 'rails_helper'

RSpec.describe "shelters/new", type: :feature do
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
