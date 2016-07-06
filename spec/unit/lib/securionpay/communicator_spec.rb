require 'spec_helper'

describe SecurionPay::Communicator do
  let(:service_url) { 'some_service_url' }
  let(:path) { 'some_path' }
  let(:body) { double }
  let(:web_consumer) { double }
  let(:secret_key) { double }
  let(:response) { double }
  let(:post_request_body) do
    {
      body: body,
      basic_auth: {
        username: secret_key
      }
    }
  end
  let(:get_request_body) do
    {
      body: nil,
      basic_auth: {
        username: secret_key
      }
    }
  end
  let(:request_body) { get_request_body }
  let(:params) { path }

  subject do
    described_class
  end

  before do
    subject.web_consumer = web_consumer
    SecurionPay::Configuration.secret_key = secret_key
    SecurionPay::Configuration.service_url = service_url
  end

  describe '.get' do
    let(:method) { :get }
    it_behaves_like 'send_receive'
  end

  describe '.delete' do
    let(:method) { :delete }
    it_behaves_like 'send_receive'
  end

  describe '.post' do
    let(:request_body) { post_request_body }
    let(:method) { :post }
    let(:params) { [path, body] }
    it_behaves_like 'send_receive'
  end
end
