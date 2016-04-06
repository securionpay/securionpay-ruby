module Securionpay
  module Models
    # Additional data used for fraud protection
    FraudCheckData = Struct.new(
      :ip_address,
      :ip_country,
      :email,
      :user_agent,
      :accept_language
    )
  end
end
