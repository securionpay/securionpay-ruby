module Securionpay
  module Parsers
    # Parse response
    class ResponseParser
      def parse(request, response)
        method = Utils.response_method_name(request)
        payload = transaction_manager.send(method, response)

        Response.new(payload)
      end

      private

      def transaction_manager
        Transaction::Manager
      end
    end
  end
end
