module SecurionPay
  class Customers
    extend TransactionBase

    def self.create(params)
      communicator.post("/customers", params)
    end

    def self.retrieve(customer_id)
      communicator.get("/customers/#{customer_id}")
    end

    def self.update(customer_id, params)
      communicator.post("/customers/#{customer_id}", params)
    end

    def self.delete(customer_id)
      communicator.delete("/customers/#{customer_id}")
    end

    def self.list(params = nil)
      communicator.get("/customers", params)
    end
  end
end
