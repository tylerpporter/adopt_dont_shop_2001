require 'rails_helper'

RSpec.describe 'Usability features for /shelter' do
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
    @pet3 = Pet.create(image: "https://api.time.com/wp-content/uploads/2014/06/49cb79d35e3640a1b005287de39f1754-0.jpg",
                   name: "Darlin",
                   description: "Loves to cuddle, needs daily ointment.",
                   approximate_age: 2,
                   sex: "Female",
                   shelter_id: @shelter2.id
      )
  end

  it "allows user to edit a shelter" do
    visit '/shelters'

    within("#shelter-#{@shelter1.id}") do
      click_link 'Edit'
    end

    expect(current_path).to eq("/shelters/#{@shelter1.id}/edit")
  end

  it "allows user to delete a shelter" do
    visit '/shelters'

    within("#shelter-#{@shelter1.id}") do
      click_link 'Delete'
    end

    expect(current_path).to eq("/shelters")
    expect(page).to_not have_content(@shelter1.name)
  end

  describe "Usability features for /shelters/:id/pets" do
    it "allows user to edit a pet" do
      visit "/shelters/#{@shelter1.id}/pets"

      within("#pet-#{@pet1.id}") do
        click_link 'Edit'
      end

      expect(current_path).to eq("/pets/#{@pet1.id}/edit")
    end

    it "allows user to delte a pet" do
      visit "/shelters/#{@shelter1.id}/pets"

      expect(page).to have_content(@pet1.name)
      expect(page).to have_content(@pet2.name)

      within("#pet-#{@pet1.id}") do
        click_link 'Delete'
      end

      expect(current_path).to eq("/pets")
      expect(page).to_not have_content(@pet1.name)
      expect(page).to have_content(@pet2.name)
    end
  end

end
