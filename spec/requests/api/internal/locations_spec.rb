require 'rails_helper'

describe '/api/internal/locations' do

  describe 'for known country' do
    let(:country_code) { Country.last.country_code }
    let(:valid_auth_key) { Rails.configuration.api['auth_key'] }

    specify do
      get "/api/internal/locations/#{country_code}", nil, { 'X-InternalApiAuthKey' => valid_auth_key }

      expect(response.status).to eql 200

      parsed_response = JSON.parse(response.body)
      expect(parsed_response).to be_a Hash
      expect(parsed_response).to have_key 'locations'
    end
  end
end
