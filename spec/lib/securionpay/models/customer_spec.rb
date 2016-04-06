require 'spec_helper'

describe Securionpay::Models::Customer do
  it 'gets object type' do
    expect(described_class.new.object_type).to eq('customer')
  end
end
