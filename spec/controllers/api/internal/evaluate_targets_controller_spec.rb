require 'rails_helper'

describe Api::Internal::EvaluateTargetsController do
  let(:valid_auth_key) { Rails.configuration.api['auth_key'] }

  before do
    request.headers['X-InternalApiAuthKey'] = valid_auth_key
  end

  describe 'invlid params' do
    before do
      post :create
    end

    specify do
      expect(response).to be_error
      expect(response.body).to include('param is missing')
    end
  end

  # describe 'valid params' do
  #   before do
  #     post :create, country_code: 'pl', target_group_id: '1', locations: 'x'
  #   end

  #   specify do
  #     expect(response).to be_success
  #   end
  # end
end
