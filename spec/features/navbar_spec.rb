require 'rails_helper'

RSpec.describe "all pages" do
  before :each do
    @shelter1 = Shelter.create(name: 'FuzzTime',
                              address: "895 Fuzz St.",
                              city: "Westminster",
                              state: "CO",
                              zip: "80021"
      )
    @shelter2 = Shelter.create(name: 'KatsR-Us',
                              address: "123 Purr Pl.",
                              city: "Arvada",
                              state: "CO",
                              zip: "80005"
      )
    @pet1 = Pet.create(image: "https://upload.wikimedia.org/wikipedia/en/d/df/Sam_dog.jpg",
                      name: "Sam",
                      description: "Crazy AF and mean...",
                      approximate_age: 23,
                      sex: "Male",
                      shelter_id: @shelter1.id,
      )
    @pet2 = Pet.create(image: "https://cdn.fstoppers.com/styles/large-16-9/s3/lead/2018/12/cat-parody-instagram-removal.jpg",
                      description: "Weird AF but sweet.",
                      name: "Burt",
                      approximate_age: 47,
                      sex: "Male",
                      shelter_id: @shelter1.id,
      )
    end
  it "allows user to go to /pets" do
    visit "/"
    within("#navbar") do
      click_link "Pets"
    end
    expect(current_path).to eq("/pets")

    visit "/pets"
    within("#navbar") do
      click_link "Pets"
    end
    expect(current_path).to eq("/pets")

    visit "/shelters"
    within("#navbar") do
      click_link "Pets"
    end
    expect(current_path).to eq("/pets")

    visit "/pets/#{@pet1.id}"
    within("#navbar") do
      click_link "Pets"
    end
    expect(current_path).to eq("/pets")

    visit "/shelters/#{@shelter1.id}"
    within("#navbar") do
      click_link "Pets"
    end
    expect(current_path).to eq("/pets")

    visit "/pets/#{@pet1.id}/edit"
    within("#navbar") do
      click_link "Pets"
    end
    expect(current_path).to eq("/pets")

    visit "/shelters/#{@shelter1.id}/edit"
    within("#navbar") do
      click_link "Pets"
    end
    expect(current_path).to eq("/pets")
  end

  it "allows user to go to /" do
    visit "/"
    within("#navbar") do
      click_link "Home"
    end
    expect(current_path).to eq("/")

    visit "/pets"
    within("#navbar") do
      click_link "Home"
    end
    expect(current_path).to eq("/")

    visit "/shelters"
    within("#navbar") do
      click_link "Home"
    end
    expect(current_path).to eq("/")

    visit "/pets/#{@pet1.id}"
    within("#navbar") do
      click_link "Home"
    end
    expect(current_path).to eq("/")

    visit "/shelters/#{@shelter1.id}"
    within("#navbar") do
      click_link "Home"
    end
    expect(current_path).to eq("/")

    visit "/pets/#{@pet1.id}/edit"
    within("#navbar") do
      click_link "Home"
    end
    expect(current_path).to eq("/")

    visit "/shelters/#{@shelter1.id}/edit"
    within("#navbar") do
      click_link "Home"
    end
    expect(current_path).to eq("/")
  end

  it "allows user to go to /shelters" do
    visit "/"
    within("#navbar") do
      click_link "Shelters"
    end
    expect(current_path).to eq("/shelters")

    visit "/pets"
    within("#navbar") do
      click_link "Shelters"
    end
    expect(current_path).to eq("/shelters")

    visit "/shelters"
    within("#navbar") do
      click_link "Shelters"
    end
    expect(current_path).to eq("/shelters")

    visit "/pets/#{@pet1.id}"
    within("#navbar") do
      click_link "Shelters"
    end
    expect(current_path).to eq("/shelters")

    visit "/shelters/#{@shelter1.id}"
    within("#navbar") do
      click_link "Shelters"
    end
    expect(current_path).to eq("/shelters")

    visit "/pets/#{@pet1.id}/edit"
    within("#navbar") do
      click_link "Shelters"
    end
    expect(current_path).to eq("/shelters")

    visit "/shelters/#{@shelter1.id}/edit"
    within("#navbar") do
      click_link "Shelters"
    end
    expect(current_path).to eq("/shelters")
  end
end
