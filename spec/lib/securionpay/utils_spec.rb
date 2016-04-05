require 'spec_helper'

describe Securionpay::Utils do
  let(:request) do
    Securionpay::Request.new(
      transaction_type,
      payload
    )
  end

  subject do
    described_class
  end

  shared_examples_for 'method_name' do |parameter|
    it 'gets method name' do
      expect(
        subject.request_method_name(request)
      ).to eq(parameter[:request_method_name])

      expect(
        subject.response_method_name(request)
      ).to eq(parameter[:response_method_name])
    end
  end

  context 'card as payload' do
    let(:payload) { Securionpay::Models::Card.new }

    context 'transaction type create' do
      let(:transaction_type) { :create }

      it_behaves_like(
        'method_name',
        request_method_name: 'card_create_request',
        response_method_name: 'card_create_response'
      )
    end

    context 'transaction type retrieve' do
      let(:transaction_type) { :retrieve }

      it_behaves_like(
        'method_name',
        request_method_name: 'card_retrieve_request',
        response_method_name: 'card_retrieve_response'
      )
    end
  end

  context 'customer as payload' do
    let(:payload) { Securionpay::Models::Customer.new }

    context 'transaction type create' do
      let(:transaction_type) { :create }

      it_behaves_like(
        'method_name',
        request_method_name: 'customer_create_request',
        response_method_name: 'customer_create_response'
      )
    end

    context 'transaction type retrieve' do
      let(:transaction_type) { :retrieve }

      it_behaves_like(
        'method_name',
        request_method_name: 'customer_retrieve_request',
        response_method_name: 'customer_retrieve_response'
      )
    end
  end
end
