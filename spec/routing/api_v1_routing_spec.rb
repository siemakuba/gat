require 'rails_helper'

describe '/api/v1/*' do
  specify 'locations' do
    expect(get('/api/v1/locations/code')).to route_to(controller: 'api/v1/locations', action: 'show', country_code: 'code')
  end

  specify 'target_groups' do
    expect(get('/api/v1/target_groups/code')).to route_to(controller: 'api/v1/target_groups', action: 'show', country_code: 'code')
  end
end


describe '/api/internal/*' do
  specify 'locations' do
    expect(get('/api/internal/locations/code')).to route_to(controller: 'api/internal/locations', action: 'show', country_code: 'code')
  end

  specify 'target_groups' do
    expect(get('/api/internal/target_groups/code')).to route_to(controller: 'api/internal/target_groups', action: 'show', country_code: 'code')
  end

  specify 'evaluate_target' do
    expect(post('/api/internal/evaluate_target')).to route_to(controller: 'api/internal/evaluate_targets', action: 'create')
  end
end
