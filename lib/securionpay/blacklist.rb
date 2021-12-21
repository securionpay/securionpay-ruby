# frozen_string_literal: true

module SecurionPay
  # Blacklist can be used to block unwanted charges.
  class Blacklist
    extend TransactionBase

    def self.create(params)
      communicator.post("#{Configuration.service_url}/blacklist", json: params)
    end

    def self.retrieve(blacklist_rule_id)
      communicator.get("#{Configuration.service_url}/blacklist/#{blacklist_rule_id}")
    end

    def self.delete(blacklist_rule_id)
      communicator.delete("#{Configuration.service_url}/blacklist/#{blacklist_rule_id}")
    end

    def self.list(params = nil)
      communicator.get("#{Configuration.service_url}/blacklist", query: params)
    end
  end
end
