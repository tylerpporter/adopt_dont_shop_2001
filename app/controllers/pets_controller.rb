class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @shelter = Shelter.find(params[:id])
  end

  def create
    new.pets.create(pets_params)
    redirect_to "/shelters/#{new.id}/pets"
  end

  private

  def pets_params
    params.permit(:image, :name, :description, :approximate_age, :sex, :shelter)
  end

end
