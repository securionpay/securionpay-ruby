# frozen_string_literal: true

module SecurionPay
  class Customers
    extend TransactionBase

    def self.create(params)
      communicator.post("#{Configuration.service_url}/customers", json: params)
    end

    def self.retrieve(customer_id)
      communicator.get("#{Configuration.service_url}/customers/#{customer_id}")
    end

    def self.update(customer_id, params)
      communicator.post("#{Configuration.service_url}/customers/#{customer_id}", json: params)
    end

    def self.delete(customer_id)
      communicator.delete("#{Configuration.service_url}/customers/#{customer_id}")
    end

    def self.list(params = nil)
      communicator.get("#{Configuration.service_url}/customers", query: params)
    end
  end
end
