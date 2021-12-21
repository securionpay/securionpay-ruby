# frozen_string_literal: true

module SecurionPay
  class Charges
    extend TransactionBase

    def self.create(params)
      communicator.post("#{Configuration.service_url}/charges", json: params)
    end

    def self.retrieve(charge_id)
      communicator.get("#{Configuration.service_url}/charges/#{charge_id}")
    end

    def self.update(charge_id, params)
      communicator.post("#{Configuration.service_url}/charges/#{charge_id}", json: params)
    end

    def self.list(params = nil)
      communicator.get("#{Configuration.service_url}/charges", query: params)
    end

    def self.capture(charge_id)
      communicator.post("#{Configuration.service_url}/charges/#{charge_id}/capture")
    end

    def self.refund(charge_id, params = nil)
      communicator.post("#{Configuration.service_url}/charges/#{charge_id}/refund", json: params)
    end
  end
end
