require 'rails_helper'

RSpec.describe Shelter, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :address}
    it {should validate_presence_of :city}
    it {should validate_presence_of :state}
    it {should validate_presence_of :zip}
  end
  describe 'relationships' do
    it {should have_many :pets}
  end
  describe 'class methods' do
    it '.sort' do
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
      expect(Shelter.sort).to eq([shelter2, shelter1])
    end
  end
end
