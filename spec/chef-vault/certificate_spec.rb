RSpec.describe ChefVault::Certificate do
  let(:item) { double(ChefVault::Item) }
  let(:cert) { ChefVault::Certificate.new("foo", "bar") }

  before do
    allow(ChefVault::Item).to receive(:load).with("foo", "bar"){ item }
    allow(item).to receive(:[]).with("id"){ "bar" }
    allow(item).to receive(:[]).with("contents"){ "baz" }
  end

  describe '#new' do
    it 'loads item' do
      expect(ChefVault::Item).to receive(:load).with("foo", "bar")

      ChefVault::Certificate.new("foo", "bar")
    end
  end

  describe '#[]' do
    specify { expect(cert['id']).to eq 'bar' }
  end

  describe 'decrypt_contents' do
    it 'echoes warning' do
      expect(STDOUT).to receive(:puts).with("WARNING: This method is deprecated, please switch to item['value'] calls")
      cert.decrypt_contents
    end

    it 'returns items contents' do
      expect(item).to receive(:[]).with("contents")

      expect(cert.decrypt_contents).to eq 'baz'
    end
  end
end
