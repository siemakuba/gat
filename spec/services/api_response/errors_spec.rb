require 'rails_helper'

describe ApiResponse::Errors do
  let(:messages) { ['Error Foo', 'Error Bar'] }
  let(:response_body) do
    JSON.generate({ errors: messages })
  end

  subject { described_class.new(messages) }
  specify do
    expect(subject.to_json).to eql(response_body)
  end

  specify do
    expect(subject.status).to eql(:unprocessable_entity)
  end
end
