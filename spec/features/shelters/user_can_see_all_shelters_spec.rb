require 'rails_helper'

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
