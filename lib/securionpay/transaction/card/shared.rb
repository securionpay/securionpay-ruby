module Securionpay
  module Transaction
    module Card
      # Parse card response
      class Shared
        def self.response(response)
          Models::Card.new(
            response['id'],
            response['created'],
            response['objectType'],
            nil,
            nil,
            response['first6'],
            response['last4'],
            response['fingerprint'],
            response['expMonth'],
            response['expYear'],
            response['cardholderName'],
            response['customerId'],
            response['brand'],
            response['type']
          )
        end
      end
    end
  end
end
