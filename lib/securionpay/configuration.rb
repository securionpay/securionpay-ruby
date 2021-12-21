# frozen_string_literal: true

module SecurionPay
  class Configuration
    class << self
      attr_accessor :secret_key
      attr_reader :service_url, :uploads_url
    end

    @service_url = 'https://api.securionpay.com'
    @uploads_url = 'https://uploads.securionpay.com'

    def self.service_url=(service_url)
      @service_url = if service_url.nil?
                       'https://api.securionpay.com'
                     else
                       service_url.gsub(%r{/$}, "")
                     end
    end

    def self.uploads_url=(uploads_url)
      @uploads_url = if uploads_url.nil?
                       'https://uploads.securionpay.com'
                     else
                       uploads_url.gsub(%r{/$}, "")
                     end
    end
  end
end
