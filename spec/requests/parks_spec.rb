require 'rails_helper'

RSpec.describe 'Parks API' do
  let!(:neighborhood) { create(:neighborhood) }
  let!(:parks) { create_list(:park, 10, neighborhood_id: neighborhood.id ) }
  let(:neighborhood_id) { neighborhood.id}
  let(:id) { parks.first.id }


  describe 'Get /neighborhoods/neighborhood_id/parks' do
    before { get "/neighborhoods/#{neighborhood_id}/parks" }

    context 'when Neighborhood exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all parks' do
        expect(json.size).to eq(10)
      end
    end

    context 'when neighborhood does not exist' do
      let(:neighborhood_id) { 0 }

      it 'returns status code of 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Neighborhood/)
      end
    end
  end

  describe 'GET /neighborhoods/:neighborhood_id/parks/:id' do
    before { get "/neighborhoods/#{neighborhood_id}/parks/#{id}" }

    context 'when neighborhood park exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the park' do
        expect(json['id']).to eq(id)
      end
    end


    context 'when neighborhood park does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Neighborhood with 'id'=#{:id}/)
      end
    end
  end

  describe 'POST /neighborhoods/:neighborhood_id/parks' do
    let(:valid_attributes) { { name: 'Gas Works', description: 'A grassy field in Fremont.', address: '555 fremont way', bathroom: true, drinking_fountain: true, dog_park: true, playground:true, latitude: -122.4, longitude: 89.4, neighborhood_id: neighborhood.id} }

    context 'when request attributes are valid' do
      before { post "/neighborhoods/#{neighborhood_id}/parks", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/neighborhoods/#{neighborhood_id}/parks", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  # Test suite for PUT /neighborhoods/:neighborhood_id/parks/:id
  describe 'PUT /neighborhoods/:neighborhood_id/parks/:id' do
    let(:valid_attributes) { { name: 'Mozart' } }

    before { put "/neighborhoods/#{neighborhood_id}/parks/#{id}", params: valid_attributes }

    context 'when park exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the park' do
        updated_park = Park.find(id)
        expect(updated_park.name).to match(/Mozart/)
      end
    end

    context 'when the park does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Park/)
      end
    end
  end


  describe 'DELETE /neighborhoods/:id' do
    before { delete "/neighborhoods/#{neighborhood_id}/parks/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
