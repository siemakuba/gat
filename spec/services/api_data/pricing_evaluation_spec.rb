require 'rails_helper'

describe ApiData::PricingEvaluation do

  subject { described_class.new(params: params, pricing_calculator: pricing_calculator) }

  let(:params) { {
    country_code: 'pl',
    locations: [
      { id: 1, panel_size: 100 },
      { id: 2, panel_size: 200 }
    ]
  } }
  let(:pricing_calculator) { double }

  before do
    allow(pricing_calculator).to receive(:calculate).with(panel_size: 100).and_return(111.0)

    allow(pricing_calculator).to receive(:calculate).with(panel_size: 200).and_return(222.0)
  end

  specify 'returned value' do
    expect(subject.to_hash).to eql({
      country_code: 'pl',
      locations: params[:locations],
      calculated_prices: [
        { id: 1, panel_size: 100, calculated_price: 111.0 },
        { id: 2, panel_size: 200, calculated_price: 222.0 }
      ]
    })
  end
end
