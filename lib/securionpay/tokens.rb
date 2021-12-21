# frozen_string_literal: true

module SecurionPay
  class Tokens
    extend TransactionBase

    def self.create(params)
      communicator.post("#{Configuration.service_url}/tokens", json: params)
    end

    def self.retrieve(token_id)
      communicator.get("#{Configuration.service_url}/tokens/#{token_id}")
    end
  end
end
