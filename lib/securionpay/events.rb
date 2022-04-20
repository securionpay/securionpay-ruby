# frozen_string_literal: true

module SecurionPay
  class Events
    extend TransactionBase

    def self.retrieve(event_id)
      communicator.get("#{Configuration.api_url}/events/#{event_id}")
    end

    def self.list(params = nil)
      communicator.get("#{Configuration.api_url}/events", query: params)
    end
  end
end
