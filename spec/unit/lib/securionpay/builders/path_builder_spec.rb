require 'spec_helper'

describe SecurionPay::Builders::PathBuilder do
  let(:customer_id) { 'some_customer_id' }
  let(:card_id) { 'some_card_id' }
  let(:blacklist_rule_id) { 'some_blacklist_rule_id' }
  let(:cross_sale_offer_id) {'some_cross_sale_offer_id' }
  let(:customer_record_type) {'some_customer_record_type' }
  let(:customer_record_type_id) {'some_customer_record_type_id' }
  let(:charge_id) { 'charge_id' }
  let(:capture) { false }
  let(:refund) { false }

  subject do
    described_class
  end

  describe '.build_card_path' do
    it 'gets path with card_id' do
      result = subject.build_card_path(customer_id, card_id)
      expect(result).to eq('/customers/some_customer_id/cards/some_card_id')
    end

    it 'gets path without card_id' do
      result = subject.build_card_path(customer_id)
      expect(result).to eq('/customers/some_customer_id/cards')
    end
  end

  describe '.build_customers_path' do
    it 'gets path with customer_id' do
      result = subject.build_customers_path(customer_id)
      expect(result).to eq('/customers/some_customer_id')
    end

    it 'gets path without customer_id' do
      result = subject.build_customers_path
      expect(result).to eq('/customers')
    end
  end

  describe '.build_blacklist_path' do
    it 'gets path with blacklist_rule_id' do
      result = subject.build_blacklist_path(blacklist_rule_id)
      expect(result).to eq('/blacklist/some_blacklist_rule_id')
    end

    it 'gets path without blacklist_rule_id' do
      result = subject.build_blacklist_path
      expect(result).to eq('/blacklist')
    end
  end

  describe '.build_charges_path' do
    it 'gets path with charge_id' do
      result = subject.build_charges_path(charge_id)
      expect(result).to eq('/charges/charge_id')
    end

    it 'gets path with charge_id and capture' do
      result = subject.build_charges_path(charge_id, :capture)
      expect(result).to eq('/charges/charge_id/capture')
    end

    it 'gets path with charge_id and refund' do
      result = subject.build_charges_path(charge_id, :refund)
      expect(result).to eq('/charges/charge_id/refund')
    end

    it 'gets path without charge_id' do
      result = subject.build_charges_path
      expect(result).to eq('/charges')
    end
  end

  describe '.build_cross_sale_offers_path' do
    it 'gets path with cross_sale_offer_id' do
      result = subject.build_cross_sale_offers_path(cross_sale_offer_id)
      expect(result).to eq('/cross_sale_offers/some_cross_sale_offer_id')
    end

    it 'gets path without cross_sale_offer_id' do
      result = subject.build_cross_sale_offers_path
      expect(result).to eq('/cross_sale_offers')
    end
  end

  describe '.build_customer_records_path' do
    it 'gets path with cross_sale_offer_id' do
      result = subject.build_customer_records_path(cross_sale_offer_id)
      expect(result).to eq('/customer-records/some_cross_sale_offer_id')
    end

    it 'gets path with cross_sale_offer_id and customer_record_type' do
      result = subject.build_customer_records_path(cross_sale_offer_id, customer_record_type)
      expect(result).to eq('/customer-records/some_cross_sale_offer_id/some_customer_record_type')
    end

    it 'gets path with cross_sale_offer_id and customer_record_type and customer_record_type_id' do
      result = subject.build_customer_records_path(cross_sale_offer_id, customer_record_type, customer_record_type_id)
      expect(result).to eq('/customer-records/some_cross_sale_offer_id/some_customer_record_type/some_customer_record_type_id')
    end

    it 'gets path without cross_sale_offer_id' do
      result = subject.build_customer_records_path
      expect(result).to eq('/customer-records')
    end
  end
end
