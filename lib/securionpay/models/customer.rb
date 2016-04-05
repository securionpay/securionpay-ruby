module Securionpay
  module Models
    # Customers allows to store credit cards for later use 
    # and to perform automatically recurring charges. 
    # Customers are also useful for tracking charges that are associated 
    # with the same entity.
    Customer = Struct.new(
      :id,
      :created,
      :object_type,
    ) do
      def initialize(*)
        super

        self.object_type = 'customer'.freeze
      end
    end
  end
end
