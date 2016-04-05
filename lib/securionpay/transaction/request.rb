module Securionpay
  module Transaction
    Request = Struct.new(
      :method,
      :path,
      :body
    )
  end
end
