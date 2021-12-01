require 'httparty'

module SecurionPay
  class Communicator
    class << self
      attr_accessor :web_consumer
    end

    @web_consumer = HTTParty

    def self.get(path, params = nil)
      web_consumer.get(url(path), request(nil, params))
    end

    def self.post(path, body = nil)
      web_consumer.post(url(path), request(body))
    end

    def self.delete(path)
      web_consumer.delete(url(path), request)
    end

    def self.url(path)
      "#{Configuration.service_url}/#{path}"
    end

    def self.request(body = nil, query = nil)
      {
        body: body,
        query: query,
        basic_auth: {
          username: Configuration.secret_key
        }
      }
    end

    private_class_method :url, :request
  end
end
