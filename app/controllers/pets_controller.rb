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

  def edit
    show
  end

  def create
    new.pets.create(pets_params)
    redirect_to "/shelters/#{new.id}/pets"
  end

  def update
    updated = Pet.update(params[:id], pets_params)
    redirect_to "/pets/#{updated.id}"
  end

  private

  def pets_params
    params.permit(:image, :name, :description, :approximate_age, :sex, :shelter)
  end

end
