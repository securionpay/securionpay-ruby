module SecurionPay
  class Charges
    extend TransactionBase

    def self.create(params)
      communicator.post("/charges", params)
    end

    def self.retrieve(charge_id)
      communicator.get("/charges/#{charge_id}")
    end

    def self.update(charge_id, params)
      communicator.post("/charges/#{charge_id}", params)
    end

    def self.list(params = nil)
      communicator.get("/charges", params)
    end

    def self.capture(charge_id)
      communicator.post("/charges/#{charge_id}/capture")
    end

    def self.refund(charge_id, params = nil)
      communicator.post("/charges/#{charge_id}/refund", params)
    end
  end
end
