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

  shared_examples_for 'payload_name' do |parameter|
    let(:payload) { parameter[:payload] }
    let(:transaction_type) { parameter[:transaction_type] }

    it 'gets method name' do
      expect(
        subject.request_method_name(request)
      ).to eq(parameter[:request_method_name])

      expect(
        subject.response_method_name(request)
      ).to eq(parameter[:response_method_name])
    end
  end

  describe 'method name builder' do
    it_behaves_like(
      'payload_name',
      payload: Securionpay::Models::Card.new,
      transaction_type: :create,
      request_method_name: 'card_create_request',
      response_method_name: 'card_create_response'
    )

    it_behaves_like(
      'payload_name',
      payload: Securionpay::Models::Card.new,
      transaction_type: :retrieve,
      request_method_name: 'card_retrieve_request',
      response_method_name: 'card_retrieve_response'
    )

    it_behaves_like(
      'payload_name',
      payload: Securionpay::Models::Customer.new,
      transaction_type: :create,
      request_method_name: 'customer_create_request',
      response_method_name: 'customer_create_response'
    )

    it_behaves_like(
      'payload_name',
      payload: Securionpay::Models::Customer.new,
      transaction_type: :retrieve,
      request_method_name: 'customer_retrieve_request',
      response_method_name: 'customer_retrieve_response'
    )
  end
end
