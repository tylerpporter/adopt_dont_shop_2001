require 'rails_helper'

RSpec.describe '/shelters/:id/edit', type: :feature do
  it "allows the user to edit shelter info" do
    shelter1 = Shelter.create(name: 'FuzzTime',
                              address: "895 Fuzz St.",
                              city: "Westminster",
                              state: "CO",
                              zip: "80021")
    visit "/shelters/#{shelter1.id}"
    click_link "Update Shelter"

    expect(current_path).to eq("/shelters/#{shelter1.id}/edit")

    fill_in "Name", with: "ChipmunkSanctuary"
    fill_in "Address", with: "555 Cheeky St."
    fill_in "City", with: "Denver"
    fill_in "State", with: "CO"
    fill_in "Zip", with: "80000"
    click_button "Submit"

    expect(current_path).to eq("/shelters/#{shelter1.id}")
    
    expect(page).to have_content("ChipmunkSanctuary")
    expect(page).to have_content("555 Cheeky St.")
    expect(page).to have_content("Denver")
    expect(page).to have_content("CO")
    expect(page).to have_content("80000")
  end
end
