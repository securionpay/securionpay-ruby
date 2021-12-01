require 'spec_helper'

describe SecurionPay::TransactionBase do
  let(:communicator) { double }

  subject do
    Object.new.extend described_class
  end

  describe '.communicator' do
    it 'get object' do
      expect(subject.communicator).to be(SecurionPay::Communicator)
      subject.communicator = communicator
      expect(subject.communicator).to be(communicator)
    end
  end
end
