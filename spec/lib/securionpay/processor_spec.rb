require 'spec_helper'

describe Securionpay::Processor do
  let(:secret_key) { double }
  let(:configuration) { Securionpay::Configuration.new(secret_key) }
  let(:communicator) { instance_double(Securionpay::Communicator) }
  let(:request_builder) { instance_double(Securionpay::Builders::RequestBuilder) }
  let(:response_parser) { instance_double(Securionpay::Parsers::ResponseParser) }
  let(:dependencies) do
    {
      communicator: communicator,
      request_builder: request_builder,
      response_parser: response_parser
    }
  end

  subject do
    described_class.new(configuration, dependencies)
  end

  describe '.process' do
    it 'run process' do
      expect(request_builder).to receive(:build)
        .with(:request).and_return(:service_request)
      expect(communicator).to receive(:send_receive)
        .with(:service_request).and_return(:service_response)
      expect(response_parser).to receive(:parse)
        .with(:request, :service_response).and_return(:process_result)

      expect(subject.process(:request)).to eq(:process_result)
    end
  end
end
