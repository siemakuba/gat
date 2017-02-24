require 'rails_helper'

describe ApiResponse::Success do
  let(:response_object) { double(to_hash: { foo: :bar }) }
  let(:response_body) do
    JSON.generate(response_object.to_hash)
  end
  subject { described_class.new(response_object) }

  specify do
    expect(subject.to_json).to eql(response_body)
  end

  specify do
    expect(subject.status).to eql(:ok)
  end
end
