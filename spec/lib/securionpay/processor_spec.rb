require 'spec_helper'

describe Securionpay::Processor do
  let(:configuration) { Securionpay::Configuration.new(secret_key) }

  subject do
    described_class.new(configuration)
  end

  it 'to do' do
    # TODO
    expect(true).to be_truthy
  end
end
