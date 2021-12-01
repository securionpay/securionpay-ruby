module SecurionPay
  class FraudWarnings
    extend TransactionBase

    def self.retrieve(fraud_warning_id)
      communicator.get("/fraud-warnings/#{fraud_warning_id}")
    end

    def self.list(params = nil)
      communicator.get("/fraud-warnings", params)
    end
  end
end
