require 'httparty'

module SecurionPay
  class Communicator
    class << self
      attr_accessor :web_consumer
    end

    @web_consumer = HTTParty

    def self.get(path)
      web_consumer.get(url(path), request_body)
    end

    def self.post(path, body)
      web_consumer.post(url(path), request_body(body))
    end

    def self.delete(path)
      web_consumer.delete(url(path), request_body)
    end

    def self.url(path)
      "#{Configuration.service_url}/#{path}"
    end

    def self.request_body(body = nil)
      {
        body: body,
        basic_auth: {
          username: Configuration.secret_key
        }
      }
    end

    private_class_method :url, :request_body
  end
end
