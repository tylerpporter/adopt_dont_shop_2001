class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def pets_params
    {
      image: params[:image],
      name: params[:name],
      description: params[:description],
      approximate_age: params[:approximate_age],
      sex: params[:sex],
      shelter: params[:shelter],
      status: params[:status]
    }
  end

  def create
    Pet.create(pets_params)
    redirect_to "/pets"
  end

  def show
    @pet = Pet.find(params[:id])
  end

end
