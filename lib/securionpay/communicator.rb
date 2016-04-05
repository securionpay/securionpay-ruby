module Securionpay
  class Communicator
    attr_reader :web_consumer, :service_url, :user_name
    private :web_consumer, :service_url, :user_name

    def initialize(web_consumer, service_url, user_name)
      @web_consumer = web_consumer
      @service_url = service_url
      @user_name = user_name
    end

    def send_receive(request)
      case request.method
      when :get
        web_consumer.get(
          url(request.path),
          request(request.body)
        )
      when :post
        web_consumer.post(
          url(request.path),
          request(request.body)
        )
      else
        raise ArgumentError, "Method: '#{request.method}' is not supported yet."
      end
    end

    private

    def url(path)
      "#{service_url}/#{path}"
    end

    def request(body)
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
