require 'rails_helper'

describe '/api/internal/target_groups' do

  describe 'for known country' do
    let(:country_code) { Country.last.country_code }
    let(:valid_auth_key) { Rails.configuration.api['auth_key'] }

    specify do
      get "/api/internal/target_groups/#{country_code}", nil, { 'X-InternalApiAuthKey' => valid_auth_key }

      expect(response.status).to eql 200

      parsed_response = JSON.parse(response.body)
      expect(parsed_response).to be_a Hash
      expect(parsed_response).to have_key 'target_groups'
    end
  end
end
