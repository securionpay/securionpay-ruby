module Securionpay
  module Models
    # Additional data used for fraud protection
    FraudCheckData = Struct.new(
      :ipAddress,
      :ipCountry,
      :email,
      :userAgent,
      :acceptLanguage
    )
  end
end
