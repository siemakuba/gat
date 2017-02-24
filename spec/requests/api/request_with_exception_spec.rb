require 'rails_helper'

describe 'API request throwing exception' do
  specify do
    get '/api/v1/locations/unknown_country'

    expect(response.status).to eql 500

    parsed_response = JSON.parse(response.body)
    expect(parsed_response).to be_a Hash
    expect(parsed_response).to have_key 'error'
  end
end
