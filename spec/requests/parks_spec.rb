require 'rails_helper'

RSpec.describe 'Parks API', type: :request do

  let!(:neighborhood) { create(:neighborhood) }
  let!(:parks) { create_list(:park, 10) }

  let(:neighborhood_id) { neighborhood.id}
  let(:id) { parks.first.id }


  describe 'Get /neighborhoods/neighborhood_id/parks' do
    before { get "/neighborhoods/#{neighborhood_id}/parks" }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

  end
end
