# frozen_string_literal: true

module SecurionPay
  class Configuration
    class << self
      attr_accessor :secret_key
      attr_reader :api_url, :uploads_url
    end

    @api_url = 'https://api.securionpay.com'
    @uploads_url = 'https://uploads.securionpay.com'

    def self.api_url=(api_url)
      @api_url = if api_url.nil?
                   'https://api.securionpay.com'
                 else
                   api_url.gsub(%r{/$}, "")
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
