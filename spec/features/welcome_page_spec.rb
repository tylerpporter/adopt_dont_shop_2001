require 'rails_helper'

RSpec.describe "welcome index page", type: :feature do
  it "has a welcome page with a link to all shelters" do
    visit "/"
    click_link "Shelters"

    expect(current_path).to eq("/shelters")
  end
end
