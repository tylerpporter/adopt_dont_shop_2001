class SheltersController < ApplicationController

  def index
    @shelters = Shelter.all
  end

  def new; end

  def create
    Shelter.create(shelter_params)
    redirect_to "/shelters"
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def edit
    show
  end

  def update
    updated = Shelter.update(params[:id], shelter_params)
    redirect_to "/shelters/#{updated.id}"
  end

  def destroy
    Shelter.delete(params[:id])
    redirect_to "/shelters"
  end

  def index_pets
    @pets = show.pets
  end

  private

  def shelter_params
    params.permit(:name, :address, :city, :state, :zip)
  end

end
