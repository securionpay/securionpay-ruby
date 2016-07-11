require 'spec_helper'

describe SecurionPay::TransactionBase do
  let(:communicator) { double }
  let(:path_builder) { double }

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

  describe '.path_builder' do
    it 'get object' do
      expect(subject.path_builder).to be(SecurionPay::Builders::PathBuilder)
      subject.path_builder = path_builder
      expect(subject.path_builder).to be(path_builder)
    end
  end
end
