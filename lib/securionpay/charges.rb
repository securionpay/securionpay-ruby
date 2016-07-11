module SecurionPay
  class Charges
    extend TransactionBase

    def self.create(params)
      communicator.post(
        path_builder.build_charges_path,
        params
      )
    end

    def self.retrieve(charge_id)
      communicator.get(
        path_builder.build_charges_path(charge_id)
      )
    end

    def self.update(charge_id, params)
      communicator.post(
        path_builder.build_charges_path(charge_id),
        params
      )
    end

    def self.list
      communicator.get(
        path_builder.build_charges_path
      )
    end

    def self.capture(charge_id)
      communicator.post(
        path_builder.build_charges_path(charge_id, :capture)
      )
    end

    def self.refund(charge_id, params = nil)
      communicator.post(
        path_builder.build_charges_path(charge_id, :refund),
        params
      )
    end
  end
end
