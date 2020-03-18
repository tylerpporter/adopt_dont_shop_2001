require 'rails_helper'

RSpec.describe "welcome index page", type: :feature do
  it "has a link to all shelters" do
    visit "/"
    click_link "Shelters"

    expect(current_path).to eq("/shelters")
  end

  it "has a link to all pets" do
    visit "/"
    click_link "Pets"

    expect(current_path).to eq("/pets")
  end 
end
