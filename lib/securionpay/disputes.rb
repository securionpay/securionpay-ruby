# frozen_string_literal: true

module SecurionPay
  class Disputes
    extend TransactionBase

    def self.retrieve(dispute_id)
      communicator.get("#{Configuration.service_url}/disputes/#{dispute_id}")
    end

    def self.update(dispute_id, params)
      communicator.post("#{Configuration.service_url}/disputes/#{dispute_id}", json: params)
    end

    def self.close(dispute_id)
      communicator.post("#{Configuration.service_url}/disputes/#{dispute_id}/close")
    end

    def self.list(params = nil)
      communicator.get("#{Configuration.service_url}/disputes", query: params)
    end
  end
end
