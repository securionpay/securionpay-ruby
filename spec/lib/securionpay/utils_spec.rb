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

  shared_examples_for 'request_method_name' do |parameter|
    it 'gets method name' do
      result = subject.request_method_name(request)
      expect(result).to eq(parameter[:method_name])
    end
  end

  shared_examples_for 'response_method_name' do |parameter|
    it 'gets method name' do
      result = subject.response_method_name(request)
      expect(result).to eq(parameter[:method_name])
    end
  end

  context 'card as payload' do
    let(:payload) { Securionpay::Models::Card.new }

    context 'transaction type create' do
      let(:transaction_type) { :create }

      describe '.request_method_name' do
        it_behaves_like 'request_method_name', method_name: 'card_create_request'
      end

      describe '.response_method_name' do
        it_behaves_like 'response_method_name', method_name: 'card_create_response'
      end
    end

    context 'transaction type retrieve' do
      let(:transaction_type) { :retrieve }

      describe '.request_method_name' do
        it_behaves_like 'request_method_name', method_name: 'card_retrieve_request'
      end

      describe '.response_method_name' do
        it_behaves_like 'response_method_name', method_name: 'card_retrieve_response'
      end
    end
  end

  context 'customer as payload' do
    let(:payload) { Securionpay::Models::Customer.new }

    context 'transaction type create' do
      let(:transaction_type) { :create }

      describe '.request_method_name' do
        it_behaves_like 'request_method_name', method_name: 'customer_create_request'
      end

      describe '.response_method_name' do
        it_behaves_like 'response_method_name', method_name: 'customer_create_response'
      end
    end

    context 'transaction type retrieve' do
      let(:transaction_type) { :retrieve }

      describe '.request_method_name' do
        it_behaves_like 'request_method_name', method_name: 'customer_retrieve_request'
      end

      describe '.response_method_name' do
        it_behaves_like 'response_method_name', method_name: 'customer_retrieve_response'
      end
    end
  end
end
