module SecurionPay
  class CustomerRecords
    extend TransactionBase

    def self.buy(params)
      communicator.post(
        path_builder.build_customer_records_path,
        params
      )
    end

    def self.refresh(customer_record_id, params = nil)
      communicator.post(
        path_builder.build_customer_records_path(customer_record_id),
        params
      )
    end

    def self.retrieve(customer_record_id)
      communicator.get(
        path_builder.build_customer_records_path(customer_record_id)
      )
    end

    def self.list
      communicator.get(
        path_builder.build_customer_records_path
      )
    end

    def self.get_fee(customer_record_id, customer_record_fee_id)
      communicator.get(
        path_builder.build_customer_records_path(customer_record_id, :fees, customer_record_fee_id)
      )
    end

    def self.list_fees(customer_record_id)
      communicator.get(
        path_builder.build_customer_records_path(customer_record_id, :fees)
      )
    end

    def self.get_profit(customer_record_id, customer_record_profit_id)
      communicator.get(
        path_builder.build_customer_records_path(customer_record_id, :profits, customer_record_profit_id)
      )
    end

    def self.list_profits(customer_record_id)
      communicator.get(
        path_builder.build_customer_records_path(customer_record_id, :profits)
      )
    end
  end
end
