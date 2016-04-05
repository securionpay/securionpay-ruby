module Securionpay
  module Models
    # SecurionPay API is using HTTP codes to indicate result of API call.
    # Codes in range 2xx indicate success, codes in range 4xx indicate error 
    # on your side (something is wrong with your request) and codes 
    # in range 5xx indicate error on our side.
    #
    # If request resulted in error then an error object is returned instead of normal response.
    Error = Struct.new(
      :type,
      :code,
      :message
    )
  end
end
