module Securionpay
  # Processor class
  class Processor
    attr_reader :configuration
    private :configuration

    def initialize(configuration, dependencies = {})
      @configuration = configuration
      @communicator = dependencies[:communicator]
      @request_builder = dependencies[:request_builder]
      @response_parser = dependencies[:response_parser]
    end

    def process(request)
      service_request = request_builder.build(request)
      service_response = communicator.send_receive(service_request)

      response_parser.parse(request, service_response)
    end

    private

    def communicator
      @communicator || Communicator.new(
        HTTParty,
        configuration.service_url,
        configuration.secret_key
      )
    end

    def request_builder
      @request_builder || Builders::RequestBuilder.new
    end

    def response_parser
      @response_parser || Parsers::ResponseParser.new
    end
  end
end
