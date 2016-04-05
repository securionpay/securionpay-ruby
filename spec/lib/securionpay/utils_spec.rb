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

  context 'card as payload' do
    let(:payload) { Securionpay::Models::Card.new }

    context 'transaction type create' do
      let(:transaction_type) { :create }

      describe '.request_method_name' do
        it 'gets create credit card method name' do
          result = subject.request_method_name(request)
          expect(result).to eq('card_create_request')
        end
      end

      describe '.response_method_name' do
        it 'gets parse credit card method name' do
          result = subject.response_method_name(request)
          expect(result).to eq('card_create_response')
        end
      end
    end

    context 'transaction type retrieve' do
      let(:transaction_type) { :retrieve }

      describe '.request_method_name' do
        it 'gets create credit card method name' do
          result = subject.request_method_name(request)
          expect(result).to eq('card_retrieve_request')
        end
      end

      describe '.response_method_name' do
        it 'gets parse credit card method name' do
          result = subject.response_method_name(request)
          expect(result).to eq('card_retrieve_response')
        end
      end
    end
  end

  context 'customer as payload' do
    let(:payload) { Securionpay::Models::Customer.new }

    context 'transaction type create' do
      let(:transaction_type) { :create }

      describe '.request_method_name' do
        it 'gets create credit card method name' do
          result = subject.request_method_name(request)
          expect(result).to eq('customer_create_request')
        end
      end

      describe '.response_method_name' do
        it 'gets parse credit card method name' do
          result = subject.response_method_name(request)
          expect(result).to eq('customer_create_response')
        end
      end
    end

    context 'transaction type retrieve' do
      let(:transaction_type) { :retrieve }

      describe '.request_method_name' do
        it 'gets create credit card method name' do
          result = subject.request_method_name(request)
          expect(result).to eq('customer_retrieve_request')
        end
      end

      describe '.response_method_name' do
        it 'gets parse credit card method name' do
          result = subject.response_method_name(request)
          expect(result).to eq('customer_retrieve_response')
        end
      end
    end
  end
end
