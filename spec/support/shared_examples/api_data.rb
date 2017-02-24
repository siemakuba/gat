shared_examples_for "ApiData Object" do
  describe 'has requuired interface' do
    specify do
      expect(subject).to be_an Enumerable
    end

    specify do
      expect(subject).to respond_to :to_hash
    end
  end
end
