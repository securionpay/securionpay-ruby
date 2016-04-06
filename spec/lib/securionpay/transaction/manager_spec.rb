require 'spec_helper'

describe Securionpay::Transaction::Manager do
  let(:customer_id) { 'magic_customer_id' }
  let(:number) { double }
  let(:exp_month) { double }
  let(:exp_year) { double }
  let(:cvc) { double }
  let(:cardholder_name) { double }
  let(:request) do
    Securionpay::Models::Card.new.tap do |card|
      card.customer_id = customer_id
      card.number = number
      card.exp_month = exp_month
      card.exp_year = exp_year
      card.cvc = cvc
      card.cardholder_name = cardholder_name
    end
  end
  let(:response) { nil }

  describe '.card_create_request' do
    it 'gets request' do
      result = described_class.card_create_request(request)

      expect(result.method).to eq(:post)
      expect(result.path).to eq('customers/magic_customer_id/cards')
      expect(result.body[:number]).to be(number)
      expect(result.body[:expMonth]).to be(exp_month)
      expect(result.body[:expYear]).to be(exp_year)
      expect(result.body[:cvc]).to be(cvc)
      expect(result.body[:cardholderName]).to be(cardholder_name)
    end
  end
end
