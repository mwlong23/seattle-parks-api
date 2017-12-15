class ParksController < ApplicationController

  def index
    @parks = Park.all
    json_response(@parks)

  end

  private

  def park_params
    params.permit(:park).permit(:name, :description, :address, :bathroom, :drinking_fountain, :dog_park, :playground, :latitude, :longitude )
  end
end
