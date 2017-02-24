require 'rails_helper'

describe 'Internal API requests' do

  let(:valid_auth_key) { Rails.configuration.api['auth_key'] }
  let(:country_code) { 'foo' }
  let(:response_data) { {} }

  before do
    allow(ApiData::LocationsByCountryCollection).to receive(:new).with(country_code).and_return(response_data)
  end

  specify 'authenticated request' do
    get "/api/internal/locations/#{country_code}", nil, { 'X-InternalApiAuthKey' => valid_auth_key }

    expect(response.status).to eql 200
  end

  specify 'not authenticated request' do
    get "/api/internal/locations/#{country_code}", nil, { 'X-InternalApiAuthKey' => 'invalid_auth_key' }

    expect(response.status).to eql 401
  end
end
