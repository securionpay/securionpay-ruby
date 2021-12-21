# frozen_string_literal: true

module SecurionPay
  class Plans
    extend TransactionBase

    def self.create(params)
      communicator.post("#{Configuration.service_url}/plans", json: params)
    end

    def self.retrieve(plan_id)
      communicator.get("#{Configuration.service_url}/plans/#{plan_id}")
    end

    def self.update(plan_id, params)
      communicator.post("#{Configuration.service_url}/plans/#{plan_id}", json: params)
    end

    def self.delete(plan_id)
      communicator.delete("#{Configuration.service_url}/plans/#{plan_id}")
    end

    def self.list(params = nil)
      communicator.get("#{Configuration.service_url}/plans", query: params)
    end
  end
end
