require 'rails_helper'

describe ApiResponse::Unauthorized do
  let(:auth_key) { 'foo_key' }
  let(:response_body) do
    JSON.generate({ auth_key: 'foo_key' })
  end

  subject { described_class.new(auth_key) }
  specify do
    expect(subject.to_json).to eql(response_body)
  end

  specify do
    expect(subject.status).to eql(:unauthorized)
  end
end
