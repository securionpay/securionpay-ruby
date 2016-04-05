require 'httparty'

module Securionpay
  # Processor class
  class Processor
    attr_reader :configuration
    private :configuration

    def initialize(configuration)
      @configuration = configuration
    end

    def process(request)
      service_path, service_request = request_builder.build(request)
      service_response = communicator.send_receive(service_path, service_request)

      response_parser.parse(request, service_response)
    end

    private

    def transaction_manager
      @transaction_manager ||= Transaction::Manager.new
    end

    def communicator
      @communicator ||= Communicator.new(
        HTTParty,
        configuration.service_url,
        configuration.secret_key
      )
    end

    def request_builder
      @request_builder ||= Builders::RequestBuilder.new(
        transaction_manager
      )
    end

    def response_parser
      @response_parser ||= Parsers::ResponseParser.new(
        transaction_manager
      )
    end

    def transaction_manager
      Transactions::Manager.new
    end
  end
end
