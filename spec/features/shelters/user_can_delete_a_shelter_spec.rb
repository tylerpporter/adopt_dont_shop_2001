require 'rails_helper'

RSpec.describe 'DELETE /shelters/:id', type: :feature do
  it "allows the user to delete a shelter" do
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

    visit "/shelters/#{shelter1.id}"
    click_link "Delete Shelter"

    expect(current_path).to eq("/shelters")
    expect(page).to_not have_content(shelter1.name)
    expect(page).to have_content(shelter2.name)
  end
end
