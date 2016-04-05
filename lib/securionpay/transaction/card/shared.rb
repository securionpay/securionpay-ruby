module Securionpay
  module Transaction
    module Card
      class Shared
        def self.response(response)
          Models::Card.new.tap do |card|
            card.id = response['id'] if response['id']
            card.created = response['created'] if response['created']
            card.object_type = response['objectType'] if response['objectType']
            card.first6 = response['first6'] if response['first6']
            card.last4 = response['last4'] if response['last4']
            card.fingerprint = response['fingerprint'] if response['fingerprint']
            card.exp_month = response['expMonth'] if response['expMonth']
            card.exp_year = response['expYear'] if response['expYear']
            card.cardholder_name = response['cardholderName'] if response['cardholderName']
            card.customer_id = response['customerId'] if response['customerId']
            card.brand = response['brand'] if response['brand']
            card.type = response['type'] if response['type']
          end
        end
      end
    end
  end
end
