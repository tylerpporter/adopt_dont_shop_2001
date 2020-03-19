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
    @shelter = by_id
  end

  def edit
    @shelter = by_id
  end

  def update
    updated = Shelter.update(params[:id], shelter_params)
    redirect_to "/shelters/#{updated.id}"
  end

  def destroy
    Shelter.destroy(params[:id])
    redirect_to "/shelters"
  end

  def index_pets
    show
  end

  private

  def by_id
    Shelter.find(params[:id])
  end

  def shelter_params
    params.permit(:name, :address, :city, :state, :zip)
  end

end
