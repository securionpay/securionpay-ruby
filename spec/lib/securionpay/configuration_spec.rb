require 'spec_helper'

describe Securionpay::Configuration do
  let(:secret_key) { double }

  subject do
    described_class.new(secret_key)
  end

  describe '.secret_key' do
    it 'gets secret key' do
      expect(subject.secret_key).to be(secret_key)
    end
  end

  describe '.service_url' do
    it 'get service url' do
      expect(subject.service_url).to eq('https://api.securionpay.com')
    end
  end
end
