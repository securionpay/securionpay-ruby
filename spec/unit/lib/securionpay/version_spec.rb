require 'spec_helper'

describe SecurionPay do
  describe 'gem has a version number' do
    it 'checks the number' do
      expect(SecurionPay::VERSION).not_to be_falsey
    end
  end
end
