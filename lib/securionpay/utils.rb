module Securionpay
  # Contans helper methods
  module Utils
    def self.request_method_name(request)
      method_name(request, :request)
    end

    def self.response_method_name(request)
      method_name(request, :response)
    end

    def self.method_name(request, transaction_type)
      "#{request.payload.object_type}_#{request.type}_#{transaction_type}".freeze
    end
  end
end
