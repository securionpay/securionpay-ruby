module SecurionPay
  class Credits
    extend TransactionBase

    def self.create(params)
      communicator.post("/credits", params)
    end

    def self.retrieve(credit_id)
      communicator.get("/credits/#{credit_id}")
    end

    def self.update(credit_id, params)
      communicator.post("/credits/#{credit_id}", params)
    end

    def self.list(params = nil)
      communicator.get("/credits", params)
    end
  end
end
