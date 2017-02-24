require 'rails_helper'

describe ApiResponse::Exception do
  let(:exception) { StandardError.new('Foo Exception') }
  let(:response_body) do
    JSON.generate({ error: 'Foo Exception' })
  end

  subject { described_class.new(exception) }
  specify do
    expect(subject.to_json).to eql(response_body)
  end

  specify do
    expect(subject.status).to eql(:internal_server_error)
  end
end
