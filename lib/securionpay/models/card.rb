module Securionpay
  module Models
    # Card represents a credit or a debit card
    #
    # Cards are used to save a credit or a debit card data for later use. 
    # Cards can also be used to represent card data in other operations 
    # (for example to specify card data when creating a new change).
    Card = Struct.new(
      :id,
      :created,
      :object_type,
      :first6,
      :last4,
      :fingerprint,
      :exp_month,
      :exp_year,
      :cardholder_name,
      :customer_id,
      :brand,
      :type,
      :address_country,
      :address_city,
      :address_state,
      :address_zip,
      :address_line_1,
      :address_line_2,
      :fraud_check_data
    )
  end
end
