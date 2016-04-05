module Securionpay
  # General configuration
  class Configuration
    attr_reader :secret_key, :service_url
    
    def initialize(secret_key)
      @secret_key = secret_key
      @service_url = 'https://api.securionpay.com'.freeze
    end
  end
end
