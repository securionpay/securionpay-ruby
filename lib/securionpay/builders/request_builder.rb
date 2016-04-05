module Securionpay
  module Builders
    # Call transaction manager
    class RequestBuilder
      def build(request)
        method = Utils.request_method_name(request) 
        transaction_manager.send(method, request.payload)
      end

      private

      def transaction_manager
        Transaction::Manager
      end
    end
  end
end
