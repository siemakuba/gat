shared_examples_for "Locations Resource" do
  before do
    get :show, country_code: country_code
  end

  describe 'valid request' do
    let(:country_code) { Country.last.country_code }

    specify '#show' do
      expect(response).to be_success
    end
  end

  describe 'invalid request' do
    let(:country_code) { 'invalid_code' }

    specify '#show' do
      expect(response).to be_error
    end
  end
end

shared_examples_for "TargetGroups Resource" do
  before do
    get :show, country_code: country_code
  end

  describe 'valid request' do
    let(:country_code) { Country.last.country_code }

    specify '#show' do
      expect(response).to be_success
    end
  end

  describe 'invalid request' do
    let(:country_code) { 'invalid_code' }

    specify '#show' do
      expect(response).to be_error
    end
  end
end
