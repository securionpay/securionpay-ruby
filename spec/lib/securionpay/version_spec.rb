require 'spec_helper'

describe Securionpay do
  describe 'gem has a version number' do
    it 'checks the number' do
      expect(Securionpay::VERSION).not_to be_falsey
    end
  end
end
