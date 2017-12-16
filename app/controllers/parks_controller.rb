class ParksController < ApplicationController
  before_action :set_neighborhood
  before_action :set_neighborhood_park, only: [:show, :update, :destroy]

  def index
    binding.pry
    json_response(@neighborhood.parks)
  end

  def show
    json_response(@park)
  end

  def create
    @neighborhood.parks.create!(park_params)
    json_response(@neighborhood, :created)
  end

  def update
    @park.update(park_params)
    head :no_content
  end

  def destroy
    @park.destroy
    head :no_content
  end

  private

  def park_params
    params.permit(:name, :description, :address, :bathroom, :drinking_fountain, :dog_park, :playground, :latitude, :longitude )
  end

  def set_neighborhood
    @neighborhood = Neighborhood.find(params[:neighborhood_id])
  end

  def set_neighborhood_park
    @park = @neighborhood.parks.find_by!(id: params[:id]) if @neighborhood
  end
end
