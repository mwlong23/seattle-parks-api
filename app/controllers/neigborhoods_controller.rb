class NeighborhoodsController < ApplicationController

  def index
    @neighborhoods = Neighborhoods.all
    json_respons(@neighborhoods)
  end

  def create_table
    @neighborhoods = Neighborhoods.create(neighborhood_params)
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
    params.require(:neighborhood).permit(:name)
  end

  def set_neighborhood
    @neighborhood = Neighborhood.find(params[:id])
  end
end
