# frozen_string_literal: true

module  SecurionPay
  class SecurionPayException < StandardError
    attr_reader :response

    def initialize(response)
      super(response)
      @response = response
    end
  end
end
