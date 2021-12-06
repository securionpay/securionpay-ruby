# frozen_string_literal: true

module SecurionPay
  # Blacklist can be used to block unwanted charges.
  class Blacklist
    extend TransactionBase

    def self.create(params)
      communicator.post("/blacklist", params)
    end

    def self.retrieve(blacklist_rule_id)
      communicator.get("/blacklist/#{blacklist_rule_id}")
    end

    def self.delete(blacklist_rule_id)
      communicator.delete("/blacklist/#{blacklist_rule_id}")
    end

    def self.list(params = nil)
      communicator.get("/blacklist", params)
    end
  end
end
