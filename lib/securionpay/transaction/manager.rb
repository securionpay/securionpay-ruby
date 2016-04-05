module Securionpay
  module Transaction
    # Dispatch request builders and response parsers
    class Manager
      def self.card_create_request(request)
        Card::Create.request(request)
      end

      def self.card_create_response(response)
        Card::Shared.response(response)
      end

      def self.card_retrieve_request(request)
        Card::Retrieve.request(request)
      end

      def self.card_retrieve_response(response)
        Card::Shared.response(response)
      end
    end
  end
end
