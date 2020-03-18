class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def pets_params
    {
      image: params[:image],
      name: params[:name],
      approximate_age: params[:approximate_age],
      sex: params[:sex],
      shelter: params[:shelter]
    }
  end

  def create
    Pet.create(pets_params)
    redirect_to "/pets"
  end

end
