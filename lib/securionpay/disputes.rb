# frozen_string_literal: true

module SecurionPay
  class Disputes
    extend TransactionBase

    def self.retrieve(dispute_id)
      communicator.get("/disputes/#{dispute_id}")
    end

    def self.update(dispute_id, params)
      communicator.post("/disputes/#{dispute_id}", params)
    end

    def self.close(dispute_id)
      communicator.post("/disputes/#{dispute_id}/close")
    end

    def self.list(params = nil)
      communicator.get("/disputes", params)
    end
  end
end
