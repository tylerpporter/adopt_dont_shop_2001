class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def new
    @shelter_id = params[:id]
  end

  def create
    shelter = Shelter.find(params[:id])
    shelter.pets.create(pets_params)
    redirect_to "/shelters/#{params[:id]}/pets"
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def edit
    @pet = Pet.find(params[:id])
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

  def pets_params
    params.permit(:image, :name, :description, :approximate_age, :sex, :shelter)
  end

end
