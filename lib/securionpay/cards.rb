module SecurionPay
  class Cards
    extend TransactionBase

    def self.create(customer_id, params)
      communicator.post("/customers/#{customer_id}/cards", params)
    end

    def self.retrieve(customer_id, card_id)
      communicator.get("/customers/#{customer_id}/cards/#{card_id}")
    end

    def self.update(customer_id, card_id, params)
      communicator.post("/customers/#{customer_id}/cards/#{card_id}", params)
    end
    
    def self.delete(customer_id, card_id)
      communicator.delete("/customers/#{customer_id}/cards/#{card_id}")
    end

    def self.list(customer_id, params = nil)
      communicator.get("/customers/#{customer_id}/cards", params)
    end
  end
end
