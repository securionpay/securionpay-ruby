# frozen_string_literal: true

module SecurionPay
  class Subscriptions
    extend TransactionBase

    def self.create(params)
      communicator.post("#{Configuration.service_url}/subscriptions", json: params)
    end

    def self.retrieve(subscription_id)
      communicator.get("#{Configuration.service_url}/subscriptions/#{subscription_id}")
    end

    def self.update(subscription_id, params)
      communicator.post("#{Configuration.service_url}/subscriptions/#{subscription_id}", json: params)
    end

    def self.cancel(subscription_id)
      communicator.delete("#{Configuration.service_url}/subscriptions/#{subscription_id}")
    end

    def self.list(params = nil)
      communicator.get("#{Configuration.service_url}/subscriptions", query: params)
    end
  end
end
