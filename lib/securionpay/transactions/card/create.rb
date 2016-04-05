module Securionpay
  module Transactions
    module Card
      class Create
        def self.request(card)
          path = "customers/#{card.customer_id}/cards"
          request = {
            number: card.number,
            expMonth: card.exp_month,
            expYear: card.exp_year,
            cvc: card.cvc,
            cardholderName: card.cardholder_name
          }

          [path, request]
        end

        def self.response(response)
          Models::Card.new.tap do |card|
            card.id = response['id']
            card.created = response['created']
            card.object_type = response['objectType']
            card.first6 = response['first6']
            card.last4 = response['last4']
            card.fingerprint = response['fingerprint']
            card.exp_month = response['expMonth']
            card.exp_year = response['expYear']
            card.cardholder_name = response['cardholderName']
            card.customer_id = response['customerId']
            card.brand = response['brand']
            card.type = response['type']
          end
        end
      end
    end
  end
end
