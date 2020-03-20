require 'rails_helper'

RSpec.describe "shelters/:id/pets/new", type: :feature do
  it "allows the user to create a new pet" do
    shelter = Shelter.create(name: 'FuzzTime',
                              address: "895 Fuzz St.",
                              city: "Westminster",
                              state: "CO",
                              zip: "80021"
                            )
    visit "/shelters/#{shelter.id}/pets"
    click_link "Create Pet"

    expect(current_path).to eq("/shelters/#{shelter.id}/pets/new")

    fill_in "Image", with: "https://api.time.com/wp-content/uploads/2014/06/49cb79d35e3640a1b005287de39f1754-0.jpg"
    fill_in "Name", with: "Darlin"
    fill_in "Description", with: "Loves to cuddle, needs daily ointment."
    fill_in "Approximate age", with: 2
    fill_in "Sex", with: "Female"
    click_button "Submit"

    expect(current_path).to eq("/shelters/#{shelter.id}/pets")
    expect(page).to have_css("img[src*=de39f1754-0]")
    expect(page).to have_content("Darlin")
    expect(page).to have_content(2)
    expect(page).to have_content("Female")
  end
end
