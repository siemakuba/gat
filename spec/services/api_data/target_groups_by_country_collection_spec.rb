require 'rails_helper'

describe ApiData::TargetGroupsByCountryCollection do

  subject { described_class.new(country_code) }

  it_behaves_like "ApiData Object"

  let(:country_code) { 'pl' }
  let(:panel_provider) { double(target_groups: target_groups) }
  let(:country) { double(panel_provider_id: 1, panel_provider: panel_provider) }
  let(:target_groups) { [double(name: 'Foo', id: 1)] }

  before do
    allow(subject).to receive(:country).and_return(country)
  end

  specify 'returned value' do
    expect(subject.to_hash).to eql({
      country_code: 'pl',
      provider_id: 1,
      target_groups: [
        { name: 'Foo', id: 1 }
      ]
    })
  end
end
