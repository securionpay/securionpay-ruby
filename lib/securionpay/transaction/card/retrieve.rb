module Securionpay
  module Transaction
    module Card
      class Retrieve
        def self.request(card)
          path = "/customers/#{card.customer_id}/cards/#{card.id}"

          Request.new(:get, path)
        end
      end
    end
  end
end
