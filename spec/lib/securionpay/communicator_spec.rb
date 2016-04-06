require 'spec_helper'

describe Securionpay::Communicator do
  let(:web_consumer) { double }
  let(:service_url) { 'magic_service_url' }
  let(:user_name) { double }
  let(:path) { 'magic_path' }
  let(:request) do
    Securionpay::Transaction::Request.new(
      method,
      path,
      body
    )
  end

  subject do
    described_class.new(web_consumer, service_url, user_name)
  end

  shared_examples_for 'send_receive' do |parameter|
    let(:method) { parameter[:method] }

    it 'return response' do
      expect(web_consumer).to receive(parameter[:method])
      .with(
        'magic_service_url/magic_path',
        {
          body: body,
          basic_auth: {
            username: user_name
          }
        }
      )
      .and_return(:response)

      expect(
        subject.send_receive(request)
      ).to eq(:response)
    end
  end

  describe '.send_receive' do
    context 'get method' do
      let(:body) { nil }
      it_behaves_like(
        'send_receive',
        method: :get
      )
    end

    context 'post method' do
      let(:body) { double }
      it_behaves_like(
        'send_receive',
        method: :post
      )
    end

    context 'not defined method' do
      let(:method) { :magic_method } 
      let(:body) { nil }
      it 'raise error' do

        expect do
          subject.send_receive(request)
        end.to raise_error(ArgumentError, "Method: 'magic_method' is not " \
                           "supported yet.")
      end
    end
  end
end
