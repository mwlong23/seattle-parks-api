require 'rails_helper'

RSpec.describe 'Neighborhoods API', type: :request do

  let!(:neighborhoods){ create_list(:neighborhood, 10)}
  let(:neighborhood_id) { neighborhoods.first.id }


  describe 'GET /neighborhoods' do

    before { get '/neighborhoods' }

    it 'returns neighborhoods' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /neighborhoods/:id' do
    before { get "/neighborhoods/#{neighborhood_id}" }

    context 'when the record exists' do
      it 'returns the neighborhood' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(neighborhood_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:neighborhood_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Neighborhood/)
      end
    end
  end

  describe 'POST /neighborhoods' do
    # valid payload
  let(:valid_attributes) {  {name: 'Ballard'} }

    context 'when the request is valid' do
      before { post '/neighborhoods', params: valid_attributes }

      it 'creates a neighborhood' do
        expect(json['name']).to eq('Ballard')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/neighborhoods', params: { title: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Name can't be blank/)
      end
    end
  end


end

# describe 'POST /neighborhoods' do
#
#   let(:validation_attributes) { { name: 'Ballard'} }
#
#   context 'when the request is valid' do
#     before { post '/neighborhoods', params: valid_attributes }
#   end
#
#   it 'creates a neighborhood' do
#     expect(json['title']).to eq('Ballard')
#   end
#
#   it 'returns status code 201' do
#     expect(response).to have_http_status(201)
#   end
# end
