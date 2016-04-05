module Securionpay
  module Transactions
    class Manager
      def card_create_request(request)
        Card::Create.request(request)
      end

      def card_create_response(response)
        Card::Create.response(response)
      end
    end
  end
end
