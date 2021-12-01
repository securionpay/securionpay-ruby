module SecurionPay
  class Tokens
    extend TransactionBase

    def self.create(params)
      communicator.post("/tokens", params)
    end

    def self.retrieve(token_id)
      communicator.get("/tokens/#{token_id}")
    end
  end
end
