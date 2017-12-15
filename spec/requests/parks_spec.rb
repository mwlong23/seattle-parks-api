require 'rails_helper'

RSpec.describe 'Parks API', type: :request do

  let(:parks) { create_list(:park, 10) }

  describe 'Get /parks' do

    # before { get '/parks' }
    #
    # it 'returns parks' do
    #   expect(json).not_to be_empty
    #   expect(json.size).to eq(10)
    # end
    #
    # it 'returns status code 200' do
    #   expect(response).to have_http_status(200)
    # end

  end
end
