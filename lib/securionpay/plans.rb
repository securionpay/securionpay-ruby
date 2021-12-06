# frozen_string_literal: true

module SecurionPay
  class Plans
    extend TransactionBase

    def self.create(params)
      communicator.post("/plans", params)
    end

    def self.retrieve(plan_id)
      communicator.get("/plans/#{plan_id}")
    end

    def self.update(plan_id, params)
      communicator.post("/plans/#{plan_id}", params)
    end

    def self.delete(plan_id)
      communicator.delete("/plans/#{plan_id}")
    end

    def self.list(params = nil)
      communicator.get("/plans", params)
    end
  end
end
