module Securionpay
  module Parsers
    class ResponseParser
      attr_reader :transaction_manager
      private :transaction_manager

      def initialize(transaction_manager)
        @transaction_manager = transaction_manager
      end

      def parse(request, response)
        method = Utils.response_method_name(request)
        payload = transaction_manager.send(method, response)

        Response.new(payload)
      end
    end
  end
end
