# frozen_string_literal: true

module SecurionPay
  class Subscriptions
    extend TransactionBase

    def self.create(params)
      communicator.post("/subscriptions", params)
    end

    def self.retrieve(subscription_id)
      communicator.get("/subscriptions/#{subscription_id}")
    end

    def self.update(subscription_id, params)
      communicator.post("/subscriptions/#{subscription_id}", params)
    end

    def self.cancel(subscription_id)
      communicator.delete("/subscriptions/#{subscription_id}")
    end

    def self.list(params = nil)
      communicator.get("/subscriptions", params)
    end
  end
end
