module Securionpay
  module Transaction
    module Card
      class Create
        def self.request(card)
          path = "customers/#{card.customer_id}/cards"
          body = {
            number: card.number,
            expMonth: card.exp_month,
            expYear: card.exp_year,
            cvc: card.cvc,
            cardholderName: card.cardholder_name
          }

          Request.new(:post, path, body)
        end
      end
    end
  end
end
