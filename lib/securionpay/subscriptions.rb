module SecurionPay
  class Subscriptions
    extend TransactionBase

    def self.create(customer_id, params)
      communicator.post(
        path_builder.build_subscriptions_path(customer_id),
        params
      )
    end

    def self.retrieve(customer_id, subscription_id)
      communicator.get(
        path_builder.build_subscriptions_path(customer_id, subscription_id)
      )
    end

    def self.update(customer_id, subscription_id, params)
      communicator.post(
        path_builder.build_subscriptions_path(customer_id, subscription_id),
        params
      )
    end

    def self.delete(customer_id, subscription_id)
      communicator.delete(
        path_builder.build_subscriptions_path(customer_id, subscription_id)
      )
    end

    def self.list(customer_id)
      communicator.get(
        path_builder.build_subscriptions_path(customer_id)
      )
    end
  end
end
