module SecurionPay
  class Customers
    extend TransactionBase

    def self.create(params)
      communicator.post(
        path_builder.build_customers_path,
        params
      )
    end

    def self.retrieve(customer_id)
      communicator.get(
        path_builder.build_customers_path(customer_id)
      )
    end

    def self.update(customer_id, params)
      communicator.post(
        path_builder.build_customers_path(customer_id),
        params
      )
    end

    def self.delete(customer_id)
      communicator.delete(
        path_builder.build_customers_path(customer_id)
      )
    end

    def self.list
      communicator.get(
        path_builder.build_customers_path
      )
    end
  end
end
