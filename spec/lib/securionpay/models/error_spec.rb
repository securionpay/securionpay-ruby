require 'spec_helper'

describe Securionpay::Models::Error do
  let(:type) { double }
  let(:code) { double }
  let(:message) { double }

  subject do
    described_class.new(
      type,
      code,
      message
    )
  end

  it 'checks propreties' do
    expect(subject.type).to be(type)
    expect(subject.code).to be(code)
    expect(subject.message).to be(message)
  end
end
