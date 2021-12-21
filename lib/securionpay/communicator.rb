# frozen_string_literal: true

require 'httparty'

module SecurionPay
  class Communicator
    class << self
      attr_accessor :web_consumer
    end

    @web_consumer = HTTParty

    def self.get(url, query: nil)
      response = web_consumer.get(url, request(query: query))
      handle_response(response)
      response
    end

    def self.post(url, json: nil, body: nil)
      response = web_consumer.post(url, request(json: json, body: body))
      handle_response(response)
      response
    end

    def self.delete(url)
      response = web_consumer.delete(url, request)
      handle_response(response)
      response
    end

    def self.request(json: nil, query: nil, body: nil)
      headers = {
        "User-Agent" => "SecurionPay-Ruby/#{SecurionPay::VERSION} (Ruby/#{RUBY_VERSION})",
        "Accept" => "application/json",
      }
      if json
        raise ArgumentError("Cannot specify both body and json") if body

        body = json.to_json
        headers["Content-Type"] = "application/json"
      end

      {
        body: body,
        query: query,
        headers: headers,
        basic_auth: {
          username: Configuration.secret_key
        }
      }
    end

    def self.handle_response(response)
      raise SecurionPayException, response if (400..599).cover?(response.code)
    end

    private_class_method :request, :handle_response
  end
end
