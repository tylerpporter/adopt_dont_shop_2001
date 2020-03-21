class SheltersSortController < ApplicationController

  def index
    @shelters = Shelter.sort
  end

end
