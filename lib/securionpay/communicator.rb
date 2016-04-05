module Securionpay
  class Communicator
    attr_reader :web_consumer, :service_url, :user_name
    private :web_consumer, :service_url, :user_name

    def initialize(web_consumer, service_url, user_name)
      @web_consumer = web_consumer
      @service_url = service_url
      @user_name = user_name
    end

    def send_receive(path, body)
      web_consumer.post(
        url(path),
        request(body)
      )
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
