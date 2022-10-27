# frozen_string_literal: true

module SecurionPay
  class PaymentMethods
    extend TransactionBase

    def self.create(params)
      communicator.post("#{Configuration.api_url}/payment-methods", json: params)
    end

    def self.retrieve(plan_id)
      communicator.get("#{Configuration.api_url}/payment-methods/#{plan_id}")
    end

    def self.delete(plan_id)
      communicator.delete("#{Configuration.api_url}/payment-methods/#{plan_id}")
    end

    def self.list(params = nil)
      communicator.get("#{Configuration.api_url}/payment-methods", query: params)
    end
  end
end
