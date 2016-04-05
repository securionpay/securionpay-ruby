module Securionpay
  module Transaction
    # Request container
    Request = Struct.new(
      :method,
      :path,
      :body
    )
  end
end
