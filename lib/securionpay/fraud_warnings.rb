# frozen_string_literal: true

module SecurionPay
  class FraudWarnings
    extend TransactionBase

    def self.retrieve(fraud_warning_id)
      communicator.get("#{Configuration.service_url}/fraud-warnings/#{fraud_warning_id}")
    end

    def self.list(params = nil)
      communicator.get("#{Configuration.service_url}/fraud-warnings", query: params)
    end
  end
end
