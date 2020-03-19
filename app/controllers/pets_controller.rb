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

  def pets_params
    {
      image: params[:image],
      name: params[:name],
      description: params[:description],
      approximate_age: params[:approximate_age],
      sex: params[:sex],
      shelter: params[:shelter]
    }
  end

  def create
    new.pets.create(pets_params)
    redirect_to "/shelters/#{new.id}/pets"
  end

end
