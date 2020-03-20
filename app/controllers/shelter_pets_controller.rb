class ShelterPetsController < SheltersController

  def index_pets
    @shelter_pets = by_id
  end

end
