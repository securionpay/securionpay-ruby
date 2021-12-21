# frozen_string_literal: true

module SecurionPay
  class Credits
    extend TransactionBase

    def self.create(params)
      communicator.post("#{Configuration.service_url}/credits", json: params)
    end

    def self.retrieve(credit_id)
      communicator.get("#{Configuration.service_url}/credits/#{credit_id}")
    end

    def self.update(credit_id, params)
      communicator.post("#{Configuration.service_url}/credits/#{credit_id}", json: params)
    end

    def self.list(params = nil)
      communicator.get("#{Configuration.service_url}/credits", query: params)
    end
  end
end
