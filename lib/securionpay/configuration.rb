module SecurionPay
  class Configuration
    class << self
      attr_accessor :service_url, :private_key
    end

    @service_url = 'https://api.securionpay.com'.freeze
  end
end
