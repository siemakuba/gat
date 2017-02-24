require 'rails_helper'

describe Api::Internal::EvaluateTargetsController do
  let(:valid_auth_key) { Rails.configuration.api['auth_key'] }

  before do
    request.headers['X-InternalApiAuthKey'] = valid_auth_key
  end

  describe 'invalid params' do
    before do
      post :create
    end

    specify do
      expect(response).to be_unprocessable

      parsed_body = JSON.parse(response.body)
      expect(parsed_body).to have_key('errors')
      expect(parsed_body['errors']).to be_an(Array)
    end
  end

  describe 'valid params' do
    let(:country) { Country.first }
    let(:params) { {
      country_code: country.country_code,
      target_group_id: 1,
      locations: [{ id: 1, panel_size: 100 }]
    } }

    before do
      post :create, params
    end

    specify do
      expect(response).to be_success

      parsed_body = JSON.parse(response.body)
      expect(parsed_body).to have_key('country_code')
      expect(parsed_body).to have_key('locations')
      expect(parsed_body).to have_key('calculated_prices')
      expect(parsed_body['calculated_prices'].first).to have_key('calculated_price')
    end
  end
end
