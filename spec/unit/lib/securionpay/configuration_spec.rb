require 'spec_helper'

describe SecurionPay::Configuration do
  let(:service_url) { double }
  let(:private_key) { double }

  subject do
    described_class
  end

  before do
    SecurionPay::Configuration.service_url = service_url
    SecurionPay::Configuration.private_key = private_key
  end

  describe '.service_url' do
    it 'get service_url' do
      expect(subject.service_url).to be(service_url)
    end
  end

  describe '.private_key' do
    it 'gets private_key' do
      expect(subject.private_key).to be(private_key)
    end
  end
end
