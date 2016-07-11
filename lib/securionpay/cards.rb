module SecurionPay
  class Cards
    extend TransactionBase

    def self.create(customer_id, params)
      communicator.post(
        path_builder.build_card_path(customer_id),
        params
      )
    end

    def self.retrieve(customer_id, card_id)
      communicator.get(
        path_builder.build_card_path(customer_id, card_id)
      )
    end

    def self.update(customer_id, card_id, params)
      communicator.post(
        path_builder.build_card_path(customer_id, card_id),
        params
      )
    end
    
    def self.delete(customer_id, card_id)
      communicator.delete(
        path_builder.build_card_path(customer_id, card_id)
      )
    end

    def self.list(customer_id)
      communicator.get(
        path_builder.build_card_path(customer_id)
      )
    end
  end
end
