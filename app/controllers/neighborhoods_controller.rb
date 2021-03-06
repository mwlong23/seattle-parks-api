class NeighborhoodsController < ApplicationController
  before_action :set_neighborhood, only: [:show, :update, :destroy]

  def index
    @neighborhoods = Neighborhood.all
    json_response(@neighborhoods)
  end

  def search
  neighborhood_name = params[:name]
  @neighborhood = Neighborhood.search(neighborhood_name)
  json_response(@neighborhood)
  end

  def random
    @neighborhoods = Neighborhood.random()
    json_response(@neighborhoods)
  end

  def create
    @neighborhoods = Neighborhood.create!(neighborhood_params)
    json_response(@neighborhoods, :created)
  end

  def show
    json_response(@neighborhood)
  end

  def update
    @neighborhood.update(neighborhood_params)
  end

  def destroy
    @neighborhood.destroy
    head :no_content
  end


private

  def neighborhood_params
    params.permit(:name, :created_at, :updated_at)
  end

  def set_neighborhood
    @neighborhood = Neighborhood.find(params[:id])
  end
end
