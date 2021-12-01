# frozen_string_literal: true

module SecurionPay
  class Events
    extend TransactionBase

    def self.retrieve(event_id)
      communicator.get("/events/#{event_id}")
    end

    def self.list(params = nil)
      communicator.get("/events", params)
    end
  end
end
