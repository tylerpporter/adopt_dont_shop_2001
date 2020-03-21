require 'rails_helper'

RSpec.describe "/shelters", type: :feature do
  it "allows user to see all shelter names" do
    shelter1 = Shelter.create(name: 'FuzzTime',
                              address: "895 Fuzz St.",
                              city: "Westminster",
                              state: "CO",
                              zip: "80021"
                            )
    shelter2 = Shelter.create(name: 'DogPaws',
                              address: "123 Pup St.",
                              city: "Arvada",
                              state: "CO",
                              zip: "80005"
                            )
    visit "/shelters"
#     click_link "Sort Shelters (Alphabetical)"
# require "pry"; binding.pry
#
#     page.body.index(shelter2.name).should < page.body.index(shelter1.name)
    expect(page).to have_content(shelter1.name)
    expect(page).to have_content(shelter2.name)
  end
end
