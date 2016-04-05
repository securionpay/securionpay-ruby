module Securionpay
  module Transaction
    class Manager
      def card_create_request(request)
        Card::Create.request(request)
      end

      def card_create_response(response)
        Card::Shared.response(response)
      end

      def card_retrieve_request(request)
        Card::Retrieve.request(request)
      end

      def card_retrieve_response(response)
        Card::Shared.response(response)
      end
    end
  end
end
