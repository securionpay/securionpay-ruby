require 'spec_helper'

describe Securionpay::Models::Card do
  subject do
    described_class.new
  end

  it 'gets object type' do
    expect(subject.object_type).to eq('card')
  end
end
