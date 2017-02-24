require 'rails_helper'

describe '/api/v1/locations' do

  describe 'for known country' do
    let(:country_code) { Country.last.country_code }

    specify do
      get "/api/v1/locations/#{country_code}"

      expect(response.status).to eql 200

      parsed_response = JSON.parse(response.body)
      expect(parsed_response).to be_a Hash
      expect(parsed_response).to have_key 'locations'
    end
  end
end
