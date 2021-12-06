# frozen_string_literal: true

require 'httparty'

module SecurionPay
  class Communicator
    class << self
      attr_accessor :web_consumer
    end

    @web_consumer = HTTParty

    def self.get(path, params = nil)
      response = web_consumer.get(url(path), request(nil, params))
      handle_response(response)
      response
    end

    def self.post(path, body = nil)
      response = web_consumer.post(url(path), request(body))
      handle_response(response)
      response
    end

    def self.delete(path)
      response = web_consumer.delete(url(path), request)
      handle_response(response)
      response
    end

    def self.url(path)
      "#{Configuration.service_url}#{path}"
    end

    def self.request(body = nil, query = nil)
      body = body.to_json unless body.nil?
      {
        body: body,
        query: query,
        headers: {
          "User-Agent" => "SecurionPay-Ruby/#{SecurionPay::VERSION} (Ruby/#{RUBY_VERSION})",
          "Content-Type" => "application/json",
        },
        basic_auth: {
          username: Configuration.secret_key
        }
      }
    end

    def self.handle_response(response)
      raise SecurionPayException, response if (400..599).cover?(response.code)
    end

    private_class_method :url, :request, :handle_response
  end
end
