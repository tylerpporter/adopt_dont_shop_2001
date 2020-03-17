class SheltersController < ApplicationController

  def index
    @shelters = Shelter.all
  end

  def new
  end

  def shelter_params
    {
      name: params[:name],
      address: params[:address],
      city: params[:city],
      state: params[:state],
      zip: params[:zip]
    }
  end

  def create
    Shelter.create(shelter_params)
    redirect_to "/shelters"
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

end
