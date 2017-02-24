require 'rails_helper'

describe Api::Internal::LocationsController do
  let(:valid_auth_key) { Rails.configuration.api['auth_key'] }

  before do
    request.headers['X-InternalApiAuthKey'] = valid_auth_key
  end

  it_behaves_like "Locations Resource"
end
