class FindController < ApplicationController

  def search
  end

  def random
    @random_neighborhood = Neighborhood.all

    json_response(@random_neighborhood)
  end


end
