class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def show
    @pet = by_id
  end

  def new
    @shelter = Shelter.find(params[:id])
  end

  def edit
    @pet = by_id
  end

  def create
    new.pets.create(pets_params)
    redirect_to "/shelters/#{new.id}/pets"
  end

  def update
    updated = Pet.update(params[:id], pets_params)
    redirect_to "/pets/#{updated.id}"
  end

  def destroy
    Pet.delete(params[:id])
    redirect_to "/pets"
  end

  private

  def by_id
    Pet.find(params[:id])
  end

  def pets_params
    params.permit(:image, :name, :description, :approximate_age, :sex, :shelter)
  end

end
