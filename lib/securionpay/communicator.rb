module Securionpay
  # Http communicator
  class Communicator
    attr_reader :web_consumer, :service_url, :user_name
    private :web_consumer, :service_url, :user_name

    def initialize(web_consumer, service_url, user_name)
      @web_consumer = web_consumer
      @service_url = service_url
      @user_name = user_name
    end

    def send_receive(request)
      request_method = request.method
      url = url(request.path)

      case request_method
      when :get
        web_consumer.get(
          url,
          request_body
        )
      when :post
        web_consumer.post(
          url,
          request_body(request.body)
        )
      else
        raise ArgumentError, "Method: '#{request_method}' is not supported yet."
      end
    end

    private

    def url(path)
      "#{service_url}/#{path}"
    end

    def request_body(body = nil)
      {
        body: body,
        basic_auth: basic_auth
      }
    end

    def basic_auth
      {
        username: user_name
      }
    end
  end
end
