# frozen_string_literal: true

module SecurionPay
  class Cards
    extend TransactionBase

    def self.create(customer_id, params)
      communicator.post("#{Configuration.service_url}/customers/#{customer_id}/cards", json: params)
    end

    def self.retrieve(customer_id, card_id)
      communicator.get("#{Configuration.service_url}/customers/#{customer_id}/cards/#{card_id}")
    end

    def self.update(customer_id, card_id, params)
      communicator.post("#{Configuration.service_url}/customers/#{customer_id}/cards/#{card_id}", json: params)
    end

    def self.delete(customer_id, card_id)
      communicator.delete("#{Configuration.service_url}/customers/#{customer_id}/cards/#{card_id}")
    end

    def self.list(customer_id, params = nil)
      communicator.get("#{Configuration.service_url}/customers/#{customer_id}/cards", query: params)
    end
  end
end
