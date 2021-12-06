# frozen_string_literal: true

module SecurionPay
  class Configuration
    class << self
      attr_accessor :service_url, :secret_key
    end

    @service_url = 'https://api.securionpay.com'
  end
end
