require 'spec_helper'

describe Securionpay::Models::Card do
  it 'gets object type' do
    expect(described_class.new.object_type).to eq('card')
  end
end
