module Securionpay
  # Contans helper methods
  module Utils
    def self.request_method_name(request)
      "#{request.payload.object_type}_#{request.type}_request".freeze
    end

    def self.response_method_name(request)
      "#{request.payload.object_type}_#{request.type}_response".freeze
    end
  end
end
