module Securionpay
  module Builders
    # Call transaction manager
    class RequestBuilder
      attr_reader :transaction_manager
      private :transaction_manager

      def initialize(transaction_manager)
        @transaction_manager = transaction_manager
      end

      def build(request)
        method = Utils.request_method_name(request) 
        transaction_manager.send(method, request.payload)
      end
    end
  end
end
